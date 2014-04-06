# My ./config directory in silverstripe looks like this:
# ./503.php <- a 503 Maintainance page
# ./_ss_environment.php <- the production environment settings
# ./deploy.rb <- is the recipe below
#

# Application settings
set :application, "domain.com"
set :shared_children, %w(assets)

# Servers settings
server 'domain.com', :app, :web, :db
set :deploy_to, "/var/www/#{application}"
set :keep_releases, 4

# User settings
set :runner, "stig"
set :user, "stig"
set :use_sudo, false # sudo isn't required for my deployment.
set :webserver_group, "www-data"

# SCM settings
# Your git clone URL
set :repository, "user@gitserver.com:/var/git/repository.git"
set :scm, "git"
set :branch, "master" # git branch to deploy
set :scm_verbose, false
# faster deploys
set :deploy_via, :remote_cache
# If git submodules is used, this is very much needed
set :git_enable_submodules, 1

# Database settings, used for taking backups and restoring databases
set :db_user, 'dbuser'
set :db_password, 'dbpass'
set :db_schema, 'dbschema'

# --------------------------------------------
# SSH
# --------------------------------------------
ssh_options[:forward_agent] = false
default_run_options[:pty] = true  # Must be set for the password prompt from git to work
ssh_options[:port] = 22

namespace :deploy do
	task :update_code, :except => { :no_release => true } do
		on_rollback {
			run "mysql -u#{db_user} -p#{db_password} #{db_schema} < #{release_path}/backup.sql"
			run "rm -rf #{release_path}; true"
		}
		strategy.deploy!
		finalize_update
	end
	
	task :finalize_update, :except => { :no_release => true } do
		
		shared_children.each{ | folder |
			run "ln -s #{shared_path}/#{folder} #{latest_release}/#{folder}"
		}
	end

  task :migrate do
		top.upload "./config/_ss_environment.php", "#{latest_release}/_ss_environment.php", :via => :scp
		run "mkdir #{latest_release}/silverstripe-cache"
		run "#{latest_release}/sapphire/sake dev/build"
		run "chmod -R g+w #{latest_release}"
		run "chown -R :www-data #{latest_release}"
		#logger.important "the migrate action doesnt make sense in our deploy"
	end

	task :restart do
		#logger.important "the restart task doesnt make sense in our deploy"
	end



	namespace :web do
		desc <<-DESC
      Puts the site in 503 maintaince mode
		DESC
		task :disable, :roles => :web, :except => { :no_release => true } do
			if previous_release
				logger.important "Putting site in maintaince"
				top.upload "./config/503.php", "#{current_release}/maintainance.php", :via => :scp
			end
		end

		desc <<-DESC
      Removes the 503 maintaince mode
		DESC
		task :enable, :roles => :web, :except => { :no_release => true } do
			if previous_release
				logger.important "Removing sites maintaince mode"
				run "rm #{current_release}/maintainance.php"
			end
		end
	end
	

	namespace :db do
		task :backup, :except => { :no_release => true } do
			logger.important "Backing up database"
			run "mysqldump -u#{db_user} -p#{db_password} #{db_schema} > #{latest_release}/backup.sql"
		end

		task :restore, :except => { :no_release => true } do
				logger.important "Restoring database"
				run "mysql -u#{db_user} -p#{db_password} #{db_schema} < #{latest_release}/backup.sql"
		end
	end
	
end

before "deploy:update_code", "deploy:web:disable"
after "deploy:symlink", "deploy:db:backup"
after "deploy:symlink", "deploy:migrate"
after "deploy:symlink", "deploy:web:enable"
after "rollback:cleanup", "deploy:db:restore"
after "deploy:update", "deploy:cleanup" 