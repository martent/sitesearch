class CombinedSearch
  attr_accessor :query

  def initialize(query)
    @query = query
  end

  def search
    raw_results = Rails.cache.fetch(["search-raw-results", @query], expires_in: 12.hours) do
      client = SiteseekerNormalizer::Client.new(APP_CONFIG['siteseeker']['account'], APP_CONFIG['siteseeker']['index'], encoding: "UTF-8")
      raw_results = client.fetch(@query)
    end
    SiteseekerNormalizer::Parse.new(raw_results, encoding: "UTF-8")
  end
end
