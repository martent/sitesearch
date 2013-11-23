# -*- coding: utf-8 -*-
require 'config'
require 'siteseeker_normalizer'
require 'nokogiri'

class Sitesearch < Sinatra::Base
  get '/' do
    client = SiteseekerNormalizer::Client.new("malmo", "webb", encoding: "UTF-8")
    @results = client.search(params)
    haml :index
  end

  not_found do
    logger.error 'Sidan finns inte'
    'Sidan finns inte'
  end

  error do
    'Nu gick något fel. Vi är ledsna.'
  end
end
