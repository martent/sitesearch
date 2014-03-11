# ElasticSearch bindings for Recommendation
module Recommendable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    settings Rails.application.config.elasticsearch

    # Explict callbacks to reindex the full doc with terms on save/update
    after_save do
      __elasticsearch__.index_document
    end

    after_destroy do
      __elasticsearch__.delete_document
    end

    mappings dynamic: 'false' do
      indexes :name, analyzer: 'simple'
      indexes :link, analyzer: 'simple'
      indexes :terms, index_analyzer: 'term_index', search_analyzer: 'term_search'
    end
  end

  def as_indexed_json(options={})
    { name: name,
      link: link,
      terms: terms.map(&:name)
    }.as_json
  end

  module ClassMethods
    def recommend(query)
      return false if query.blank?
      begin
        __elasticsearch__.search(build_es_query(query, 3)).map(&:_source)
      rescue Exception => e
        Rails.logger.error "Elasticsearch: #{e}"
        false
      end
    end

    private
      def build_es_query(query, size)
        query = sanitize_query(query)
        {
          size: size,
          query: {
            match: {
              terms: {
                query: query,
                fuzziness: 1,
                prefix_length: 0
              }
            }
          }
        }
      end

      # NOTE: The sanitizer does not allow grouping and operators in the query
      def sanitize_query(query)
        # Remove Lucene reserved characters
        query.gsub!(/([#{Regexp.escape('\\+-&|!(){}[]^~*?:/"\'')}])/, '')

        # Remove Lucene operators
        query.gsub!(/\s+\b(AND|OR|NOT)\b/i, '')
        query
      end
  end
end
