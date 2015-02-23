# Site Search

A Ruby on Rails app for the site search on the City of Malmo. Search recommendations (editors choice) are managed in the application. The [siteseeker_normalizer](https://github.com/malmostad/siteseeker_normalizer) Ruby Gem is used for the Siteseeker integration part.

## Dependencies
* Ruby 2
* PostgreSQL
* ElasticSearch 1.x
* Memcached
* PhantomJS (for testing)

## Development Setup

## Build and Deployment
Build and deployment is made with Capistrano.

Run the deployment script with one of the following command including the environment name:

```
$ bundle exec cap staging_external deploy
$ bundle exec cap staging_internal deploy
$ bundle exec cap production_external deploy
$ bundle exec cap production_internal deploy
```

## Testing
Run tests before pushing to the repository and performing deployments. The application contains high level integration/feature tests and unit tests using RSpec, Capybara and PhantomJS. To run all test cases:

```shell
$ bundle exec rspec
```
Or during development:

```shell
$ bundle exec guard
```

## License
Released under AGPL version 3.
