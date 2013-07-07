require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new(:spec)
Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = "--tags ~@fail"
end

task :test => [:spec, :cucumber]
task :default => :test
