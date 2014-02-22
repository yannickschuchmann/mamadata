# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'mamadata_micha'
set :repo_url, 'git@git.lazarski.me:mamadata/mamadata.git'

# Default branch is :master
set :branch, "devel"
set :group, 'deployers'
# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/mamadata/'

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

namespace :deploy do
  desc 'register dirs'
  task :register_dirs_uploads do
    set :uploads_dirs,    %w(uploads uploads/pictures)
    set :shared_children, []
    set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
  end
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  desc 'setup sharing folder'
  task :setup_uploads do
    on roles(:web) do
      dirs = fetch(:uploads_dirs).map { |d| File.join(shared_path, d) }
      execute "mkdir -p #{dirs.join(' ')} && chmod g+w #{dirs.join(' ')}"
    end
  end
  desc "creat symlink"
  task :symlink_uploads do
    on roles(:mailserver) do
      execute "rm -rf #{release_path}/public/uploads"
      execute "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
    end
  end
  before :publishing, :register_dirs_uploads
  after :publishing, "setup_uploads"
  after :publishing, "symlink_uploads"
  after :publishing, "restart"

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute "chgrp -R deployers #{release_path}/"
        execute "mkdir #{release_path}/mamadata_rails4/tmp && chgrp -R deployers #{release_path}/mamadata_rails4/tmp"
        execute "cd #{release_path}/mamadata_rails4/ && rake assets:clean && rake assets:precompile"
        execute "chgrp -R deployers #{release_path}/mamadata_rails4/"
      end
    end
  end

end