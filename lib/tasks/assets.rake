require "sprockets"

assets = Sprockets::Environment.new
assets.append_path 'assets/javascripts'
assets.append_path 'assets/stylesheets'
assets.js_compressor = :uglifier
assets.css_compressor = :sass

namespace :assets do
  desc "Precompile assets locally"
  task :precompile do
    assets["application.coffee"].write_to "public/assets/application-#{assets.digest}.js"
    assets["application.scss"].write_to "public/assets/application-#{assets.digest}.css"
    assets["application.coffee"].write_to "public/assets/application.js"
    assets["application.scss"].write_to "public/assets/application.css"
  end
end
