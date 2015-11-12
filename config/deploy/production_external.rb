set :rails_env, :production
set :audience, "external"
set :stage, :production_external

set :branch, "master"

role :app, %w{app_runner@srvubuwebhost25.malmo.se}
role :web, %w{app_runner@srvubuwebhost25.malmo.se}
role :db,  %w{app_runner@srvubuwebhost25.malmo.se}
