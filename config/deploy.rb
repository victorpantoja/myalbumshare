default_run_options[:pty] = true
set :application, "myalbumshare"
set :repository,  "git@github.com:victorpantoja/myalbumshare.git"

set :scm, "git"
set :user, "victor"
set :scm_passphrase, :jpfv32

set :branch, "master"

set :deploy_via, :remote_cache
set :deploy_to, "/var/www/#{application}"

role :app, "myalbumshare.com"                          # This may be the same as your `Web` server
role :db,  "myalbumshare.com", :primary => true # This is where Rails migrations will run

task :set_permissions do
  run "sudo chown -R victor:victor #{deploy_to}"
end

task :after_setup, :roles => :web do
  set_permissions
end


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end