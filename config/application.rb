require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sitesearch
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/app/uploaders)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Stockholm'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:en, "sv-SE".to_sym, :sv]
    config.i18n.default_locale = "sv-SE"
    config.encoding = "utf-8"
    config.filter_parameters += [:password]

    config.exceptions_app = self.routes

    config.assets.paths += [
      Rails.root.join("vendor", "malmo_shared_assets", "stylesheets").to_s,
      Rails.root.join("vendor", "malmo_shared_assets", "stylesheets", "shared").to_s,
      Rails.root.join("vendor", "malmo_shared_assets", "stylesheets", "external").to_s
    ]

    # config.generators do |g|
    #   g.template_engine :haml
    #   g.test_framework :rspec
    # end
  end
end
