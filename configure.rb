require "sinatra/base"
require "sinatra/config_file"

class Sitesearch < Sinatra::Base
  register Sinatra::ConfigFile
  config_file "config/settings.yml"

  before do
    env["rack.logger"] = Logger.new("#{settings.root}/log/#{settings.environment}.log")
    logger.level = Logger::INFO
    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime} #{severity}: #{msg}\n"
    end
  end

  configure do
    set :cache, Dalli::Client.new("localhost:11211", namespace: "sitesearch_malmo_se", compress: true)
    set :asset_files, {} # don't use a manifest if not in production
    set :haml, format: :xhtml, escape_attrs: false
  end

  configure :development do
    require "sinatra/reloader"

    register Sinatra::Reloader
    also_reload "#{settings.root}/configure.rb"
    also_reload "#{settings.root}/lib/*"

    before { logger.level = Logger::DEBUG }
    after { logger.close }
  end

  configure :production do
    assets_manifest = JSON.load(open("public/assets/manifest.json").read)
    set :asset_files, assets_manifest["assets"]
    before { logger.level = Logger::WARN }
  end
end
