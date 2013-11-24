# -*- coding: utf-8 -*-
require 'config'
require 'lib/helpers'

class Sitesearch < Sinatra::Base
  get '/' do
    # TODO: add caching of results with client.fetch and client.parse
    client = SiteseekerNormalizer::Client.new("malmo", "webb", encoding: "UTF-8")
    @results = client.search(params)
    @error = false

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
