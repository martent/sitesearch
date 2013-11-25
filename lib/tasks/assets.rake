require "sprockets"

assets = Sprockets::Environment.new
assets.append_path 'assets/javascripts'
assets.append_path 'assets/stylesheets'
assets.js_compressor = :uglifier
assets.css_compressor = :sass

namespace :assets do
  desc "Precompile assets"
  task precompile: :clean do
    manifest = Sprockets::Manifest.new(assets, "public/assets/manifest.json")
    manifest.compile(["application.js", "application.css"])
  end

  desc "Clean compiled assets"
  task :clean do
    rm_rf "public/assets"
  end
end
