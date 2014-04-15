set :application, 'mamadata_stagging'
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{micha@62.141.45.55}
role :web, %w{micha@62.141.45.55}
role :db,  %w{micha@62.141.45.55}
set :rails_env, "test"
# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties  on the server.
server '62.141.45.55', user: 'micha', roles: %w{web app}, my_property: :my_value
set :branch, 'devel'
# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options
set :deploy_to, '/home/mamastagging/'

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
    on roles(:web) do
      execute "rm -rf #{release_path}/mamadata_rails4/public/uploads"
      execute "ln -nfs #{shared_path}/uploads #{release_path}/mamadata_rails4/public/uploads"
    end
  end
  # before :publishing, :register_dirs_uploads
  # after :publishing, "setup_uploads"
  # after :publishing, "symlink_uploads"
  after :publishing, "restart"

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute "chgrp -R deployers #{release_path}/"
        execute "mkdir #{release_path}/mamadata_rails4/tmp && chgrp -R deployers #{release_path}/mamadata_rails4/tmp"
        # execute "cd #{release_path}/mamadata_rails4/ && rake assets:clean && rake assets:precompile"
        execute "chgrp -R deployers #{release_path}/mamadata_rails4/"
        execute "chgrp -R deployers #{shared_path}/"
      end
    end
  end
end