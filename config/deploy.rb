set :application, 'jinni'
set :repo_url, 'git@bitbucket.org:croko/backer.git'
set :branch, 'deploy'
set :scm, :git
set :rvm_type, :user
set :rvm_ruby_version, '2.2.0'
set :deploy_to, '/var/www/jinni'
set :format, :pretty
set :log_level, :debug
set :pty, true
set :linked_files, %w(config/database.yml config/secrets.yml)
set :deploy_via, :copy
set :copy_exclude, [".svn", ".git"]
set :keep_releases, 5
set :assets_roles, [:web, :app]
set :tmp_dir, "/var/www/jinni/tmp"
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_update_flags, ->{ "--update-crontab #{fetch :whenever_identifier} --set #{fetch :whenever_variables}" }

set :rails_env, 'production'                  # If the environment differs from the stage name
# set :migration_role, 'migrator'            # Defaults to 'db'
# set :conditionally_migrate, true           # Defaults to false. If true, it's skip migration if files in db/migrate not modified
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }


set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:reload'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:restart'

end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
