set :rails_env, :staging
set :stage, :staging_internal
set :branch, "2.1-duo"

set :nginx_config, "nginx_internal.conf"
set :error_page, "500_internal.html"

role :app, %w{deployer@}
role :web, %w{deployer@}
role :db,  %w{deployer@}
