# -*- coding: utf-8 -*-
require 'configure'
require 'lib/helpers'
require "yaml"

class Sitesearch < Sinatra::Base
  get '/' do
    begin
      raw_results = settings.cache.fetch(["search-raw-results"], settings.cache_ttl) do
        client = SiteseekerNormalizer::Client.new("malmo", "webb", encoding: "UTF-8", read_timeout: 5)
        client.fetch(params)
      end
      @results = SiteseekerNormalizer::Parse.new(raw_results, encoding: "UTF-8")
    rescue Dalli::RingError => e
      @error = "Memcached: #{e}"
      logger.error @error
    rescue Exception => e
      @error = "Siteseeker: #{e}"
      logger.error @error
    end

    if request.xhr?
      haml :more, layout: false
    else
      haml :index
    end
  end

  not_found do
    logger.debug "Page not found: #{request.path}"
    haml :error_404
  end

  error do
    logger.error "Server error for #{request.path}"
    logger.error "#{params['captures'].first.inspect}"
    render :error_500
  end
end
