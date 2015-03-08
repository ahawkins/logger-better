require_relative 'test_helper'

class NoTimestampTest < MiniTest::Unit::TestCase
  attr_reader :formatter

  def setup
    @formatter = Logger::Better::NoTimestampFormatter.new
  end

  def test_building_loggers_without_timestamp
    logger = Logger::Better.no_timestamp $stdout
    assert_instance_of Logger::Better::NoTimestampFormatter, logger.formatter
  end

  def test_does_not_include_the_time
    time = Time.now
    log = formatter.call 'info', time, 'app', 'hi'
    refute_includes log, time.utc.iso8601
  end

  def test_progname_is_first
    log = formatter.call 'info', Time.now, 'app', 'hi'
    # NOTE: format includes [ ] around progrname & PID, so this test
    # really asserts that it's the first "text" in the output
    assert_equal 1, log.index('app')
  end

  def test_pid_comes_after_progname
    log = formatter.call 'info', Time.now, 'app', 'hi'
    assert_before log, $$.to_s, 'app'
  end

  def test_level_comes_after_progname
    log = formatter.call 'info', Time.now, 'app', 'hi'
    assert_before log, 'info',  $$.to_s
  end

  def test_message_comes_last
    log = formatter.call 'info', Time.now, 'app', 'hi'
    assert_before log, 'hi', 'info'
  end

  def test_removes_extra_new_lines_from_end_of_message
    message = "!\n\n"

    log = formatter.call 'info', Time.now, 'app', message
    # strip here because all lines will have a new line.
    assert_equal '!', log.strip[-1]
  end

  private
  def assert_before(string, second, first)
    assert_includes string, first
    assert_includes string, second
    assert string.index(first) < string.index(second)
  end
end
