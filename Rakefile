require "bundler/gem_tasks"
require 'rake/testtask'

namespace :test do
  Rake::TestTask.new :lib do |t|
    t.test_files = Dir['test/**/*_test.rb']
  end

  task :smoke do
    require 'bundler/setup'
    require 'logger/better'

    logger = Logger.new $stdout
    logger.level = :info
    logger.info 'hello'

    require 'logger/no_timestamp'

    logger = Logger.new $stdout
    logger.level = :info
    logger.info 'hello'
  end

  task ci: [ :lib, :smoke ]
end

task test: 'test:ci'

task default: :test
