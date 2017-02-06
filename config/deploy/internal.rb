set :rails_env, :production
set :audience, "internal"
set :stage, :production_internal

set :branch, "master"

role :app, %w{app_runner@kominsok.malmo.se}
role :web, %w{app_runner@kominsok.malmo.se}
role :db,  %w{app_runner@kominsok.malmo.se}
