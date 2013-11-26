ENV['RACK_ENV'] ||= 'test'

$: << "./"
require "rubygems"
require "bundler/setup"
Bundler.require(:default)

require "sitesearch"
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'uri'

Capybara.app = Sitesearch
Capybara.javascript_driver = :poltergeist
