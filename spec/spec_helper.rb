ENV['RACK_ENV'] = 'test'

$: << "./"
require "rubygems"
require "bundler/setup"
Bundler.require(:default)

require "sitesearch"
require "rspec"
require "rack/test"

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  def app
    Sitesearch
  end
end
