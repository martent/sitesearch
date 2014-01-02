source 'http://rubygems.org'

gem 'sinatra', '1.4.4'
gem 'sinatra-contrib', '1.4.2'
gem 'haml', '4.0.4'
gem 'sass', '3.2.12'
gem 'coffee-script', '2.2.0'
gem 'uglifier', '2.3.2'
gem 'sprockets', '2.10.1'
gem 'dalli', '2.6.4'
gem 'json', '1.8.1'

gem 'siteseeker_normalizer', '0.1.1'
gem 'nokogiri', '1.6.0'

gem 'capistrano', '~> 3.0.1'
gem 'capistrano-bundler', '~> 1.1.1'
gem 'capistrano-rbenv', '2.0.0', git: "https://github.com/capistrano/rbenv.git"

group :development do
  gem 'sinatra-reloader'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rack-test'
  gem 'poltergeist'
end

group :production do
  gem 'unicorn'
#  gem 'unicorn-worker-killer'
end
