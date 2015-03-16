set :rails_env, :staging
set :audience, "internal"
set :stage, :staging_internal

# set :branch, "2.2-stable"
set :branch, "master"

role :app, %w{app_runner@}
role :web, %w{app_runner@}
role :db,  %w{app_runner@}
