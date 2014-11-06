set :rails_env, :staging
set :audience, "external"
set :stage, :staging_external

set :branch, "2.1-duo"

role :app, %w{deployer@}
role :web, %w{deployer@}
role :db,  %w{deployer@}
