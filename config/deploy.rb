# config valid only for current version of Capistrano
lock '3.4.0'

set :repo_url, 'git@github.com:monkeyKoders/ruby_svg_generator_demo.git'
set :branch, 'refactor'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :default_shell, '/bin/bash -l'

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command.to_sym do
      on roles(:app), in: :sequence, wait: 5 do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command.to_s}"
      end
    end
  end

  after 'deploy:publishing', 'deploy:restart'

end
