# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new :cop
  RSpec::Core::RakeTask.new :spec
  task default: [:cop, :spec]
rescue LoadError
end