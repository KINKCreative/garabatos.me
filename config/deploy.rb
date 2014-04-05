# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'Garabatos.me'
set :repo_url, 'https://github.com/KINKCreative/garabatos.me.git'

set :branch, 'master'
set :deploy_via, :remote_cache
set :scm, :git

set :keep_releases, 5

set :git_enable_submodules, 1

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/srv/www/garabatos.me'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"

namespace :deploy do
  before :starting, 'composer:install_executable'
end


namespace :deploy do

	task :composer_install do
    	run "php /var/www/composer.phar install --working-dir #{latest_release}"
	end

  desc 'composer install'
  task :composer_install do
    on roles(:web) do
        within release_path do
            execute 'composer', 'install', '--no-dev', '--optimize-autoloader'
        end
    end
  end

  after "deploy:finalize_update", "deploy:composer_install"

end
