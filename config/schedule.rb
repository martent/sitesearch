# Installed w/capistrano: deploy.rb

# Check output with
# $ bundle exec whenever --set 'environment=production'

set :output,  "#{path}/log/cron.log"

if environment == "production" || environment == "staging"
  every :day, at: '3:05am' do
    command "cd #{path} && ./lib/jobs/backup.sh"
  end

  every 10.minutes do
    command "cd #{path} && ./lib/jobs/backup.sh"
  end
end
