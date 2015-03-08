require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new :test do |t|
  t.test_files = Dir['test/**/*_test.rb']
end

task :require_test do
  require 'bundler/setup'
  require 'logger/better'
  require 'logger/no_timestamp'
end

task default: [ :test, :require_test ]
