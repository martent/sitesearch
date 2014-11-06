set :rails_env, :production
set :stage, :production_internal
set :branch, "2.1-duo"

server_address = "188.226.144.234"
error_page_title = "Komin – Sök: Underhåll pågår"
error_page_go_to_text = "Till Komins startsida"
error_page_go_to = "https://komin.malmo.se/"

role :app, ["deployer@#{server_address}"]
role :web, ["deployer@#{server_address}"]
role :db,  ["deployer@#{server_address}"]
