require_relative 'logger/null_logger'

require 'logger'
require 'time'

class Logger
  class Better < Logger
    module LevelPatch
      def level=(value)
        if value.is_a? Symbol
          @level = mapping.fetch(value, Logger::UNKNOWN)
        else
          @level = value
        end
      end

      def mapping
        {
          debug: Logger::DEBUG,
          info: Logger::INFO,
          warn: Logger::WARN,
          error: Logger::ERROR,
          fatal: Logger::FATAL,
          unknown: Logger::UNKNOWN
        }
      end
    end

    include LevelPatch

    class << self
      def no_timestamp(*args, &block)
        new(*args, &block).tap do |logger|
          logger.formatter = NoTimestampFormatter.new
        end
      end
    end

    def initialize(*)
      super
      @formatter = TimestampFormatter.new
    end

    class TimestampFormatter < Formatter
      def call(severity, time, progname, msg)
        format % [
          time.utc.iso8601,
          progname,
          $$,
          severity,
          msg2str(msg).strip
        ]
      end

      def format
        "%s [%s#%d] %5s: %s\n"
      end
    end

    class NoTimestampFormatter < Formatter
      def call(severity, time, progname, msg)
        format % [
          progname,
          $$,
          severity,
          msg2str(msg).strip
        ]
      end

      def format
        "[%s#%d] %5s: %s\n"
      end
    end
  end

  module BetterPatch
    def initialize(*)
      super
      @formatter = Better::TimestampFormatter.new
    end

    class << self
      def included(base)
        base.include Better::LevelPatch
      end
    end
  end

  module NoTimestampPatch
    def initialize(*)
      super
      @formatter = Better::NoTimestampFormatter.new
    end

    class << self
      def included(base)
        base.include Better::LevelPatch
      end
    end
  end
end
