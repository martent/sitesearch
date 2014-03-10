# ElasticSearch bindings for Recommendation
module Recommendable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    settings YAML.load_file("#{Rails.root.to_s}/config/elasticsearch.yml")
    if Rails.env.development?
      __elasticsearch__.client = Elasticsearch::Client.new log: true
      __elasticsearch__.client.transport.logger.formatter = proc { |s, d, p, m| "\e[32m#{m}\n\e[0m" }
    end

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
      indexes :terms do
        indexes :name, index_analyzer: 'term_index', search_analyzer: 'term_search'
      end
    end
  end

  def as_indexed_json(options={})
    self.as_json(
      only: [:name, :link],
      include: {
        terms: { only: :name }
      }
    )
  end
end
