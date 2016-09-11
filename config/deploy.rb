# # config valid only for current version of Capistrano
# lock '3.6.1'

# set :application, 'my_app_name'
# set :repo_url, 'git@example.com:me/my_repo.git'

# # Default branch is :master
# # ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# # Default deploy_to directory is /var/www/my_app_name
# # set :deploy_to, '/var/www/my_app_name'

# # Default value for :scm is :git
# # set :scm, :git

# # Default value for :format is :airbrussh.
# # set :format, :airbrussh

# # You can configure the Airbrussh format using :format_options.
# # These are the defaults.
# # set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# # Default value for :pty is false
# # set :pty, true

# # Default value for :linked_files is []
# # append :linked_files, 'config/database.yml', 'config/secrets.yml'

# # Default value for linked_dirs is []
# # append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# # Default value for default_env is {}
# # set :default_env, { path: "/opt/ruby/bin:$PATH" }

# # Default value for keep_releases is 5
# # set :keep_releases, 5



lock '3.6.1'

# set :application, 'country_city_project'
# set :repo_url, 'https://github.com/ghanshyamanand/country_city_project.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# set :use_sudo, false
# set :bundle_binstubs, nil
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# after 'deploy:publishing', 'deploy:restart'

# namespace :deploy do
#   task :restart do
#     invoke 'unicorn:reload'
#   end
# end





# -------------------------- Interakt code


# set :stages, %w(production)     #various environments
# # load "deploy/assets"                    #precompile all the css, js and images... before deployment..
# require 'bundler/capistrano'            # install all the new missing plugins...
# require 'capistrano/ext/multistage'     # deploy on all the servers..
require 'rvm/capistrano'                # if you are using rvm on your server..
# require './config/boot'

# till now no need, may need in future
# require 'capistrano/sidekiq'
# require 'whenever/capistrano'
# require 'airbrake/capistrano'
# require 'thinking_sphinx/capistrano'


before "deploy:assets:precompile","deploy:config_symlink"
set :shared_children, shared_children + %w{public/uploads}
after "deploy:update", "deploy:cleanup" #clean up temp files etc.
after "deploy:update_code","deploy:migrate"

set(:application) { "country_city_project" }

set :rvm_ruby_string, '2.1.8'             # ruby version you are using...
set :rvm_type, :user

server "139.59.30.167", :app, :web, :db, :primary => true
set (:deploy_to) { "/home/ghanshyam/#{application}/#{stage}" }
set :user, 'ghanshyam'
set :keep_releases, 10
set :repository, "https://github.com/ghanshyamanand/country_city_project.git"
set :use_sudo, false
set :scm, :git
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  desc 'Congifure symlinks like database.yml'
  task :config_symlink do
    run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    puts "Now edit the config files in #{shared_path}."
  end
  after 'deploy:setup', 'deploy:setup_config'

  desc 'Make sure local git is in sync with remote.'
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts 'WARNING: HEAD is not the same as origin/master'
      puts 'Run `git push` to sync changes.'
      exit
    end
  end
  before 'deploy', 'deploy:check_revision'
end

# no need as we are not using carrierwave
# namespace :carrierwave do
#   task :symlink, roles: :app do
#     run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/uploads"
#   end
#   after "deploy:finalize_update", "carrierwave:symlink"
# end





# -------------------------- Tasty Tab Code

# set :stages, %w(production)     #various environments
# load "deploy/assets"                    #precompile all the css, js and images... before deployment..
# require 'bundler/capistrano'            # install all the new missing plugins...
# require 'capistrano/ext/multistage'     # deploy on all the servers..
# require 'rvm/capistrano'                # if you are using rvm on your server..
# require './config/boot'
# require 'airbrake/capistrano'
# require 'capistrano/sidekiq'

# before "deploy:assets:precompile","deploy:config_symlink"

# set :shared_children, shared_children + %w{public/uploads}
# after "deploy:update", "deploy:cleanup" #clean up temp files etc.
# after "deploy:update_code","deploy:migrate"

# set(:application) { "tasty_tab" }

# set :rvm_ruby_string, '2.1.3'             # ruby version you are using...
# set :rvm_type, :system

# server "192.34.57.207", :app, :web, :db, :primary => true
# set (:deploy_to) { "/home/fizzy/#{application}/#{stage}" }
# set :user, 'fizzy'
# set :keep_releases, 10
# set :repository, "git@bitbucket.org:fizzysoftware/tasty_tab.git"
# set :use_sudo, false
# set :scm, :git
# default_run_options[:pty] = true
# ssh_options[:forward_agent] = true
# set :deploy_via, :remote_cache
# set :git_shallow_clone, 1
# set :git_enable_submodules, 1
# set :sidekiq_default_hooks, false

# namespace :deploy do

#   %w[start stop restart].each do |command|
#     desc "#{command} unicorn server"
#     task command, roles: :app, except: {no_release: true} do
#       run "/etc/init.d/unicorn_#{application} #{command}"
#     end
#   end

#   desc 'Congifure symlinks like database.yml'
#   task :config_symlink do
#     run "ln -sf #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#   # run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#   end

#   task :setup_config, roles: :app do
#     sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
#     sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
#     run "mkdir -p #{shared_path}/config"
#     # put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
#     puts "Now edit the config files in #{shared_path}."
#   end
#   after 'deploy:setup', 'deploy:setup_config'


#   desc 'Make sure local git is in sync with remote.'
#   task :check_revision, roles: :web do
#     unless `git rev-parse HEAD` == `git rev-parse origin/master`
#       puts 'WARNING: HEAD is not the same as origin/master'
#       puts 'Run `git push` to sync changes.'
#       exit
#     end
#   end
#   before 'deploy', 'deploy:check_revision'

# end

# # namespace :carrierwave do
# #   task :symlink, roles: :app do
# #     run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/uploads"
# #   end
# #   after "deploy:finalize_update", "carrierwave:symlink"
# # end
