$: << "./"
require "rubygems"
require "bundler/setup"
Bundler.require(:default)

require 'sinatra/base'
require 'sprockets'
require 'sitesearch'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  run environment
end

map '/' do
  run Sitesearch
end
