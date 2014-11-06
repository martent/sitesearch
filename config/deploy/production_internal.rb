set :rails_env, :production
set :stage, :production_internal
set :branch, "2.1-duo"

set :server_address, "188.226.144.234"
set :error_page_title, "Komin – Sök: Underhåll pågår"
set :error_page_go_to_text, "Till Komins startsida"
set :error_page_go_to, "https://komin.malmo.se/"

role :app, ["deployer@#{fetch(:server_address)}"]
role :web, ["deployer@#{fetch(:server_address)}"]
role :db,  ["deployer@#{fetch(:server_address)}"]
