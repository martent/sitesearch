# Site Search

A Ruby Sinatra app that is responsible for the user interaction part of the site search on the City of Malmo. It uses the [siteseeker_normalizer](https://github.com/malmostad/siteseeker_normalizer) Gem for the Siteseeker integration.

## Dependencies
* Ruby 1.9.3, 2.0
* Memcached or other cache store with ttl support
* PhantomJS (for testing)

## Development Setup
Copy `settings.example.yml` and add your own settings. The run:

```shell
$ bundle install
$ rackup
```
Open localhost:9292 in your browser.

## Build and Deployment
The application is built and deployed using Capistrano. Deployment scripts are included in the source code. To set your deployment configuration:

1. Copy `config/deploy.example.yml` to `config/deploy.yml` and change the settings.
2. Edit `config/deploy.rb` and the environment files in the `config/deploy/` directory if needed.

Run the deployment script with one of the following command including the environment name:

```
$ bundle exec cap staging deploy
$ bundle exec cap production deploy
```

## Testing
Run tests before pushing to the repository and performing deployments. The application contains high level integration/feature tests and unit tests using RSpec, Capybara and PhantomJS. To run all test cases:

```shell
$ rspec
```

## License
Released under AGPL version 3.
