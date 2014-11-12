require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rdoc/task'

RSpec::Core::RakeTask.new do |spec|
  spec.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  spec.pattern = 'spec/**/*_spec.rb'
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc/rdocs'
  rdoc.main = 'readme.md'
  rdoc.rdoc_files.include 'readme.md', 'lib/**/*\.rb'
 
  rdoc.options << '--line-numbers'
  rdoc.options << '--all'
end

task :default => :spec
