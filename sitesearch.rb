# -*- coding: utf-8 -*-
require 'config'
require 'siteseeker_normalizer'
require 'digest/sha1'

class Sitesearch < Sinatra::Base
  get '/' do
    logger.error 'Fox'
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
