# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

# ----- To run minitest is the bit that I added -----
# I know it's ridiculous, but there isn't a better way, it's what RSpec does, too:
# https://github.com/rspec/rspec-rails/blob/682a12067eab233c646057f984692e3b70749f32/lib/rspec/rails/tasks/rspec.rake#L2-L4
tasks = Rake.application.instance_variable_get('@tasks')
tasks['test'].clear_actions if tasks['test']
tasks['spec'].clear_actions if tasks['spec']

mrspec = Proc.new do
  sh 'mrspec', '--fail-fast'
end

task :test, &mrspec
task :spec, &mrspec
