# Installed w/capistrano: deploy.rb

# Check output with
# $ bundle exec whenever --set 'environment=production'

set :output,  "#{path}/log/cron.log"

if environment == "production"
  every :day, at: '3:00am' do
    command "cd #{path} && ./lib/jobs/backup.sh"
  end
end
