# -*- coding: utf-8 -*-
require 'config'
require 'lib/helpers'

class Sitesearch < Sinatra::Base
  get '/' do
    begin
      raw_results = settings.cache.fetch(["search-raw-results", params], 60*60*12) do
        client = SiteseekerNormalizer::Client.new("malmo", "webb", encoding: "UTF-8", read_timeout: 5)
        client.fetch(params)
      end
      @results = SiteseekerNormalizer::Parse.new(raw_results, encoding: "UTF-8")
    rescue Exception => e
      logger.error "Siteseeker: #{e}"
      @error = e
    end

    if request.xhr?
      haml :more, layout: false
    else
      haml :index
    end
  end

  not_found do
    logger.error 'Sidan finns inte'
    'Sidan finns inte'
  end

  error do
    'Nu gick något fel.'
  end
end
