set :rails_env, :production
set :audience, "internal"
set :stage, :production_internal

# set :branch, "2.2-stable"
set :branch, "master"

role :app, %w{app_runner@srvubuwebhost15.malmo.se}
role :web, %w{app_runner@srvubuwebhost15.malmo.se}
role :db,  %w{app_runner@srvubuwebhost15.malmo.se}
