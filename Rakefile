# encoding: utf-8

require 'rake'

FileList['tasks/**/*.rake'].each { |task| import task }
desc 'run all specs'

task :spec => ['spec:unit', 'spec:integration']
desc 'run all integration tests'

task :integration => ['spec:integration']

namespace :spec do
  spec_defaults = lambda do |spec|
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('unit') do |task|
  spec_defaults.call(task)
  task.pattern = 'spec/unit/**/*_spec.rb'
end

RSpec::Core::RakeTask.new('integration') do |task|
  spec_defaults.call(task)
  task.pattern = 'spec/integration/**/*_spec.rb'
end

RSpec::Core::RakeTask.new('coverage') do |task|
  spec_defaults.call(task)
  task.pattern = 'spec/{unit,integration}/*_spec.rb'
end

end

task :default => :spec