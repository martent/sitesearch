require "json"

class Sitesearch < Sinatra::Base
  before do
    env['rack.logger'] = Logger.new("#{settings.root}/log/#{settings.environment}.log")
    logger.level = Logger::INFO
    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime} #{severity}: #{msg}\n"
    end
  end

  configure do
    enable :sessions, :logging, :static

    set :app_path, "/"
    set :assets_url_base, "//assets.malmo.se/internal/3.0/"
    set :autocomplete_url, "http://malmo.appliance.siteseeker.se/qc/webb/qc"
    set :haml, format: :html5
    set :asset_files, {}

    set :cache, Dalli::Client.new('localhost:11211', namespace: "sitesearch_malmo_se", compress: true)
    set :cache_ttl, 60*60*12
  end

  configure :development do
    require "sinatra/reloader"

    set :max_age, 0
    set :cache_ttl, 1

    register Sinatra::Reloader
    also_reload "#{settings.root}/config.rb"
    also_reload "#{settings.root}/lib/*"

    before { logger.level = Logger::DEBUG }
    after { logger.close }
  end

  configure :test do
  end

  configure :staging, :production do
    disable :show_exceptions

    assets_manifest = JSON.load(open("public/assets/manifest.json").read)
    set :asset_files, assets_manifest["assets"]

    set :max_age, 60*60*4
  end

  configure :production do
    before { logger.level = Logger::WARN }
  end
end
