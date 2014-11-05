set :rails_env, 'staging'
set :branch, "2.1-internal"
set :stage, :staging_internal

role :app, %w{deployer@}
role :web, %w{deployer@}
role :db,  %w{deployer@}
