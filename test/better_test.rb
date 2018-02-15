require_relative 'test_helper'

class BetterTest < MiniTest::Test
  attr_reader :formatter

  def setup
    @formatter = Logger::Better::TimestampFormatter.new
  end

  def test_uses_the_correct_formatter
    logger = Logger::Better.new $stdout
    assert_instance_of Logger::Better::TimestampFormatter, logger.formatter
  end

  def test_uses_utc_iso_8601_times
    time = Time.now
    log = formatter.call 'info', time, 'app', 'hi'
    assert_includes log, time.utc.iso8601
  end

  def test_starts_with_the_time
    time = Time.now
    log = formatter.call 'info', time, 'app', 'hi'
    assert_equal 0, log.index(time.iso8601)
  end

  def test_progname_comes_after_time
    time = Time.now
    log = formatter.call 'info', time, 'app', 'hi'
    assert_before log, 'app', time.iso8601
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

  def test_can_set_level_with_symbol
    logger = Logger::Better.new StringIO.new

    logger.level = :debug
    assert_equal Logger::DEBUG, logger.level
    logger.level = :info
    assert_equal Logger::INFO, logger.level
    logger.level = :warn
    assert_equal Logger::WARN, logger.level
    logger.level = :error
    assert_equal Logger::ERROR, logger.level
    logger.level = :fatal
    assert_equal Logger::FATAL, logger.level
    logger.level = :unknown
    assert_equal Logger::UNKNOWN, logger.level
  end

  def tests_sets_level_unkown_when_passing_an_unkown_symol
    logger = Logger::Better.new StringIO.new

    logger.level = :foo
    assert_equal Logger::UNKNOWN, logger.level
  end

  private
  def assert_before(string, second, first)
    assert_includes string, first
    assert_includes string, second
    assert string.index(first) < string.index(second)
  end
end
