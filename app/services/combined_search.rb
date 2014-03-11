class CombinedSearch
  attr_accessor :query, :error

  def initialize(query)
    @query = query
    @error = false
  end

  def search
    from_recommendations
    from_siteseeker
  end

  def completion
  end

  private
    def from_recommendations
      @query[:q]
    end

    def from_siteseeker
      begin
        raw_results = Rails.cache.fetch(["search-raw-results", @query], expires_in: 12.hours) do
          client = SiteseekerNormalizer::Client.new(APP_CONFIG['siteseeker']['account'], APP_CONFIG['siteseeker']['index'], encoding: "UTF-8")
          raw_results = client.fetch(@query)
        end
        SiteseekerNormalizer::Parse.new(raw_results, encoding: "UTF-8")
      rescue Exception => e
        Rails.logger.error "Sitesearch: #{e}"
        @error = e
      end
    end
end
