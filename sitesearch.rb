# -*- coding: utf-8 -*-
require 'configure'
require 'lib/helpers'
require 'digest/sha1'

class Sitesearch < Sinatra::Base
  get '/' do
    etag Digest::SHA1.hexdigest(params.to_s)
    cache_control :public, max_age: settings.max_age

    begin
      raw_results = settings.cache.fetch(["raw-results", params], settings.cache_ttl) do
        logger.debug "Cache miss"
        client = SiteseekerNormalizer::Client.new(settings.search_account, settings.search_index, encoding: "UTF-8", read_timeout: 5)
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
    haml "errors/error_404".to_sym
  end

  error do
    logger.error "Server error for #{request.path}"
    logger.error "#{params['captures'].first.inspect}"
    render "errors/error_500".to_sym
  end
end
