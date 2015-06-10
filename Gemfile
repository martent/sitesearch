source 'https://rubygems.org'

gem 'rails', '4.1.10'
gem 'haml-rails', '~> 0.5.3'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '~> 2.5.3'
gem 'coffee-rails', '~> 4.0.1'
# gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails', '~> 3.1.2'
# gem 'jbuilder', '~> 2.0'

gem 'simple_form', '~> 3.1.0.rc2', :git => 'https://github.com/plataformatec/simple_form'
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 3.8.1'

gem 'pg', '~> 0.18.2'
gem 'dalli', '~> 2.7.2'
gem 'elasticsearch-model', '~> 0.1.5'
gem 'elasticsearch-rails', '~> 0.1.5'

gem 'bcrypt-ruby', '~> 3.1.5'

gem 'omniauth-github', '~> 1.1.2'
gem 'octokit', '~> 3.3.1'
gem 'siteseeker_normalizer', '0.1.6'

gem 'capistrano', '~> 3.2.1'
gem 'capistrano-rails', '~> 1.1.2'
gem 'capistrano-rbenv', '~> 2.0.2'
gem 'whenever', '~> 0.9.2', require: false

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
  gem 'rb-fsevent'
  gem 'guard-rspec'
end

group :development, :test do
  gem 'rspec-rails', '2.14.2'
  gem 'spring'
  gem 'quiet_assets'
  gem 'thin'
end

group :development do
  gem 'pry-rails'
  gem 'spring-commands-rspec'
end

gem 'unicorn', group: [ :test, :production ]
