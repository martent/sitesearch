set :rails_env, :production
set :audience, "external"
set :stage, :production_external

set :branch, "master"

role :app, %w{app_runner@161.52.13.46}
role :web, %w{app_runner@161.52.13.46}
role :db,  %w{app_runner@161.52.13.46}
