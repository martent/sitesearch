set :rails_env, :production
set :stage, :production_external
set :branch, "2.1-duo"

set :nginx_config, "nginx_external.conf"
set :error_page, "500_external.html"

role :app, %w{deployer@95.85.4.216}
role :web, %w{deployer@95.85.4.216}
role :db,  %w{deployer@95.85.4.216}
