# Installed w/capistrano: deploy.rb

# Check output with
# $ bundle exec whenever --set 'environment=production'

# Only for Postgres

# set :output,  "#{path}/log/cron.log"
#
# if audience == 'external' && environment == 'production'
#   every :day, at: '3:05am' do
#     command "cd #{path} && ./lib/jobs/backup.sh"
#   end
# end
