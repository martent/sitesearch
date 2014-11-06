set :rails_env, :staging
set :audience, "internal"
set :stage, :staging_internal

set :branch, "2.1-duo"

role :app, %w{deployer@}
role :web, %w{deployer@}
role :db,  %w{deployer@}
