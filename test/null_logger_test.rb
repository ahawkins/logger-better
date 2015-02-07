require_relative 'test_helper'
require 'logger/null_logger'

class NullLoggerTest < MiniTest::Unit::TestCase
  def test_add_does_nothing
    logger = NullLogger.new
    logger.add Logger::INFO, 'hi', 'tests'
  end

  def test_yields_when_block_given
    logger = NullLogger.new

    yielded = false

    logger.debug('foo') { yielded = true ; 'message' }

    assert yielded, 'Block not yielded'
  end

  def test_works_with_most_common_syntax
    logger = NullLogger.new

    logger.info 'foo'
  end

  def test_does_not_yield_when_message_set
    logger = NullLogger.new

    yielded = false

    logger.add(Logger::INFO, 'message') { yielded = true ; 'message' }

    refute yielded, 'Block yielded'
  end
end
