lock '3.1.0'

set :repo_url, 'PROJECT REPO URL'

server 'SERVER IP ADDRESS', user: 'deploy', roles: %w{web app db}, primary: true

set :format, :pretty
set :log_level, :info
set :pty, true
set :default_shell, 'bash -l'
set :keep_releases, 3
set :bundle_flags, '--deployment'
set :bundle_without, %w{development test deploy}.join(' ')

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

namespace :deploy do
  after :publishing, :restart
end
