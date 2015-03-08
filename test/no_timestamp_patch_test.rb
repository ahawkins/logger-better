require_relative 'test_helper'

class NoTimestampPatchTest < MiniTest::Unit::TestCase
  def test_patching_sets_correct_formatter_on_new_instances
    patched_logger = Class.new(Logger) do
      include Logger::NoTimestampPatch
    end

    logger = patched_logger.new $stdout
    assert_instance_of Logger::Better::NoTimestampFormatter, logger.formatter
  end

  def test_patching_allows_setting_level_by_symbol
    patched_logger = Class.new(Logger) do
      include Logger::BetterPatch
    end

    logger = patched_logger.new $stdout

    logger.level = :debug
    assert_equal Logger::DEBUG, logger.level
  end
end
