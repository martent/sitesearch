# -*- coding: utf-8 -*-
require 'config'
require 'lib/helpers'

class Sitesearch < Sinatra::Base
  get '/' do
    # TODO: add caching of results with client.fetch and client.parse
    client = SiteseekerNormalizer::Client.new("malmo", "webb", encoding: "UTF-8")
    @results = client.search(params)
    @fox = "barx"
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
