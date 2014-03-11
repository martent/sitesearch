# Site Search

A Ruby on Rails app for the site search on the City of Malmo’s external web site. Search recommendations (editors choice) are managed in the application. The [siteseeker_normalizer](https://github.com/malmostad/siteseeker_normalizer) gem is used for the Siteseeker integration part.

## Dependencies
* Ruby 2.0, 2.1
* Rails 4.1
* PostgreSQL
* ElasticSearch 1.0
* Memcached
* PhantomJS (for testing)

## Development Setup

## Build and Deployment
Build and deployment is made with Capistrano.

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
Or during development:

```shell
$ bundle exec guard
```

## License
Released under AGPL version 3.
