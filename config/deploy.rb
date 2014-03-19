# https://github.com/capistrano/rbenv

I18n.config.enforce_available_locales = false

set :rbenv_type, :user
set :rbenv_ruby, '2.1.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

set :application, 'sitesearch'
set :repo_url, "git@github.com:malmostad/#{fetch(:application)}.git"
# set :branch, "master"
set :branch, "v2-oauth"
set :user, "deployer"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :scm, :git
set :deploy_via, :remote_cache

# set :format, :pretty
# set :log_level, :debug
set :pty, true
set :forward_agent, true

set :linked_files, %w{config/database.yml config/app_config.yml config/secrets.yml }
set :linked_dirs, %w{log tmp/pids tmp/sockets public/system public/uploads}

set :default_env, { path: '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH' }
set :keep_releases, 5

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command do
      on roles(:app), except: {no_release: true} do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end

  task :setup do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      execute "mkdir -p #{shared_path}/tmp"
      execute "mkdir -p #{shared_path}/log"
      execute "mkdir -p #{shared_path}/system"
      execute "mkdir -p #{shared_path}/uploads"
      upload! "config/app_settings.example.yml", "#{shared_path}/config/app_settings.yml"
      upload! "config/database.example.yml", "#{shared_path}/config/database.yml"
      upload! "config/secrets.example.yml", "#{shared_path}/config/secrets.yml"
      puts "1. Edit the config files in #{shared_path}/config"
      puts "2. Run manually on server:"
      puts "   $ sudo ln -nfs #{release_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      puts "   $ sudo ln -nfs #{release_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
    end
  end

  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  before :starting, "deploy:check_revision"
  after :finishing, "deploy:cleanup"
end
