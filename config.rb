class Sitesearch < Sinatra::Base
  configure do
    enable :sessions, :logging, :static
    set :max_age, 0

    set :app_path, "" # No trailing slash
    set :assets_url_base, "//assets.malmo.se/internal/3.0" # No trailing slash
    set :haml, format: :html5
  end

  configure :development do
    require "sinatra/reloader"
    require "yaml"

    register Sinatra::Reloader
    also_reload "#{settings.root}/config.rb"
    also_reload "#{settings.root}/lib/*"
  end

  configure :test do
  end

  configure :staging, :production do
    set :show_exceptions, false
    disable :static
    set :max_age, 3600
  end
end
