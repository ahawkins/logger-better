require "bundler/gem_tasks"
require 'rake/testtask'

namespace :test do
  Rake::TestTask.new :lib do |t|
    t.test_files = Dir['test/**/*_test.rb']
  end

  task :require do
    require 'bundler/setup'
    require 'logger/better'
    require 'logger/no_timestamp'
  end

  task ci: [ :lib, :require ]
end

task test: 'test:ci'

task default: :test
