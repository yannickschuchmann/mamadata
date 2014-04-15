# config valid only for Capistrano 3.1
lock '3.1.0'

set :repo_url, 'git@github.com:yannickschuchmann/mamadata.git'

# Default branch is :master
#set :branch, "devel"


#set :branch, do
#  # Warn that branches cannot be deployed
#  puts 'Cannot deploy a branch to production' unless fetch(:branch).nil?
#
#  # Get the latest tags and set the default
#  default = `git fetch --tags && git tag`.split("n").last
#
#  # Allow the developer to choose a tag to deploy
#  tag = Capistrano::CLI.ui.ask "Choose a tag to deploy (make sure to push the tag first): [Default: #{ default }] "
#
#  # Fall back to the default if no tag was specified
#  tag = default if tag.empty?
#
#  # Be extra cautious and exit if a tag cannot be found
#  if tag.nil?
#    puts "Cannot deploy as no tag was found"
#    exit
#  end
#
#  # Return the tag to deploy
#  tag
#end

set :group, 'deployers'
# Default deploy_to directory is /var/www/my_app


# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{mamadata_rails4/bin mamadata_rails4/log mamadata_rails4/vendor/bundle mamadata_rails4/public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

