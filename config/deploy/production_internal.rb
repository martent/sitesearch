set :rails_env, :production
set :audience, "internal"
set :stage, :production_internal

set :branch, "2.1-duo"

role :app, ["deployer@188.226.144.234"]
role :web, ["deployer@188.226.144.234"]
role :db,  ["deployer@188.226.144.234"]
