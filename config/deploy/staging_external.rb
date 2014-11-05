set :rails_env, 'staging'
set :branch, "2.1-external"
set :stage, :staging_external

role :app, %w{deployer@}
role :web, %w{deployer@}
role :db,  %w{deployer@}
