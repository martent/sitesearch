set :rails_env, :staging
set :stage, :staging_external
set :branch, "2.1-duo"

set :nginx_config, "nginx_external.conf"
set :error_page, "500_external.html"

role :app, %w{deployer@}
role :web, %w{deployer@}
role :db,  %w{deployer@}
