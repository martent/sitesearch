$: << "./"
require "bundler/setup"
require 'sinatra/base'
require 'sprockets'
require 'sitesearch'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.js_compressor = :uglifier if ENV['RACK_ENV'] == "production"
  environment.css_compressor = :sass if ENV['RACK_ENV'] == "production"
  run environment
end

map '/' do
  run Sitesearch
end
