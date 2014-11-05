set :rails_env, 'production'
set :branch, "2.1-external"
set :stage, :production_external

role :app, %w{deployer@95.85.4.216}
role :web, %w{deployer@95.85.4.216}
role :db,  %w{deployer@95.85.4.216}
