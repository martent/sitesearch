# https://github.com/capistrano/rbenv

set :rbenv_type, :user
set :rbenv_ruby, '2.0.0-p353'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

set :application, 'sitesearch'
set :repo_url, "git@github.com:malmostad/#{fetch(:application)}.git"
set :branch, "master"
set :user, "deployer"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :scm, :git
set :deploy_via, :remote_cache

# set :format, :pretty
# set :log_level, :debug
set :pty, true
set :forward_agent, true

# set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/sockets public/system}

set :default_env, { path: '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH' }
set :keep_releases, 5

namespace :deploy do
  %w[start stop restart upgrade].each do |command|
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
      upload! "config/settings.example.yml", "#{shared_path}/config/settings.yml"
      puts "1. Edit the config files in #{shared_path}/config"
      puts "2. Run manually on server:"
      puts "   $ sudo ln -nfs #{release_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      puts "   $ sudo ln -nfs #{release_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
    end
  end

  task :symlink_config do
    on roles(:app) do
      execute "ln -nfs #{shared_path}/config/settings.yml #{release_path}/config/settings.yml"
    end
  end
  after :updated, "deploy:symlink_config"

  desc "Precompile assets on server"
  task :precompile_assets do
    on roles(:app), except: {no_release: true} do
      within release_path do
        execute :rake, "assets:precompile"
      end
    end
  end
  after :updated, "deploy:precompile_assets"

  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  before :starting, "deploy:check_revision"
  after :finishing, "deploy:cleanup"
end
