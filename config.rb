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
    set :max_age, 0

    set :app_path, "/" # No trailing slash
    set :assets_url_base, "//assets.malmo.se/internal/3.0/"
    set :autocomplete_path, "http://webapps06.malmo.se/dashboard/search/autocomplete"
    set :haml, format: :html5

    set :cache, Dalli::Client.new('localhost:11211', namespace: "sitesearch_malmo_se", compress: true)
  end

  configure :development do
    require "sinatra/reloader"
    require "yaml"

    register Sinatra::Reloader
    also_reload "#{settings.root}/config.rb"
    also_reload "#{settings.root}/lib/*"

    before { logger.level = Logger::DEBUG }
    after { logger.close }
  end

  configure :test do
  end

  configure :staging, :production do
    disable :static, :show_exceptions
    set :max_age, 3600
  end

  configure :production do
    before { logger.level = Logger::WARN }
  end
end
