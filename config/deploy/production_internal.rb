set :rails_env, 'production'
set :branch, "2.1-duo"
set :stage, :production_internal

role :app, %w{deployer@188.226.144.234}
role :web, %w{deployer@188.226.144.234}
role :db,  %w{deployer@188.226.144.234}
