# Site Search

A Ruby on Rails app for the external site search on the City of Malmo and the intranet. Search recommendations are managed in the application. The [siteseeker_normalizer](https://github.com/malmostad/siteseeker_normalizer) Ruby Gem is used for the Siteseeker integration part.

## Dependencies
* nginx (for production)
* Ruby 2
* MySQL or PostgreSQL
* ElasticSearch 1.4
* Memcached

## Development Setup

Dependencies:
* Vagrant
* A Vagrant compatible virtual machine such as VirtualBox or VMWare

To provision the Vagrant box, run the following command in the root of the project on the host:

    $ vagrant up

Check `install_info.txt` in project root when the provisioning has finished.

To log in to the box:

    $ vagrant ssh

Start the application in the Vagrant box:

    $ cd /vagrant
    $ rails s -b 0.0.0.0

You should now be able to access the server in your host system at http://127.0.0.1:3030


## Server Setup

To provision an Ubuntu 14.04 server:

2. 1. Add `app_runner` as a sudo user on the server
2. Download the provisioning files:

     $ wget https://github.com/malmostad/sitesearch/blob/master/puppet/bootstrap.sh
     $ wget https://github.com/malmostad/sitesearch/blob/master/puppet/server.pp

4. Check that server.pp looks OK and start the provisioning:

    $ sudo ./bootstrap.sh

5. Check `install_info.txt` in `app_runner`'s home directory when the provisioning has finished

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
