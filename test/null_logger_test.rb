require_relative 'test_helper'
require 'logger/null_logger'

class NullLoggerTest < MiniTest::Unit::TestCase
  def test_add_does_nothing
    logger = NullLogger.new
    logger.add Logger::INFO, 'hi', 'tests'
  end
end
