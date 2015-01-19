every 1.day, at: '2:30 am' do
  rake 'sitemap:generate'
end

set :output, '/var/www/apps/11795/current/log/custom_deploy_after_migrate.log'