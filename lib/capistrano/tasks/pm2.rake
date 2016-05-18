# We have to use an absolute project_root to make pm2 work properly
# See http://pm2.keymetrics.io/docs/tutorials/capistrano-like-deployments

namespace :pm2 do
  task :ecosystem do
    js_code = <<-END_OF_DOC
fs = require('fs')
json = JSON.parse(fs.readFileSync('current/ecosystem.json'))
for (i in json.apps) { json.apps[i].cwd = process.cwd() + '/current' }
fs.writeFileSync('current/ecosystem.json', JSON.stringify(json, null, 2))
    END_OF_DOC
    pm2_execute :node, "-e #{js_code.split("\n").join(';').inspect}"
  end

  desc 'pm2 start'
  task start: :ecosystem do
    pm2_execute :pm2, :start, 'current/ecosystem.json'
  end

  desc 'pm2 startOrRestart'
  task startOrRestart: :ecosystem do
    pm2_execute :pm2, :startOrRestart, 'current/ecosystem.json'
  end

  desc 'pm2 stop'
  task :stop do
    pm2_execute :pm2, :stop, 'current/ecosystem.json'
  end

  desc 'pm2 delete'
  task :delete do
    pm2_execute :pm2, :delete, 'current/ecosystem.json'
  end

  desc 'pm2 kill'
  task :kill do
    pm2_execute :pm2, :kill
  end

  desc 'pm2 list'
  task :list do
    pm2_execute :pm2, :list
  end

  desc 'pm2 logs'
  task :logs do
    pm2_execute :pm2, :logs
  end

  desc 'pm2 save'
  task :save do
    pm2_execute :pm2, :save
  end

  def pm2_execute(*args)
    on roles fetch(:pm2_roles) do
      within deploy_path do
        execute *args
      end
    end
  end
end

# Configurations
set :pm2_roles, :all

# Hooks
after 'deploy:published', 'pm2:startOrRestart'
