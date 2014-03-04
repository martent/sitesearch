# Site Search

A Ruby on Rails app that is responsible for the site search on the City of Malmo’s external web site. It uses the [siteseeker_normalizer](https://github.com/malmostad/siteseeker_normalizer) Gem for the Siteseeker integration. Editors choice is managed in the application itself.

## Dependencies
* Ruby 1.9.3, 2.0, 2.1
* PostgreSQL
* Memcached or other cache store with ttl support
* PhantomJS (for testing)

## Development Setup

## Build and Deployment
The application is built and deployed using Capistrano. Deployment scripts are included in the source code.

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
