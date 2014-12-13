require 'logger'
require 'time'

class Logger
  def level=(value)
    if value.is_a? Symbol
      @level = mapping.fetch(value, UNKNOWN)
    else
      @level = value
    end
  end

  def mapping
    {
      debug: DEBUG,
      info: INFO,
      warn: WARN,
      error: ERROR,
      fatal: FATAL,
      unknown: UNKNOWN
    }
  end

  class Formatter
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
end
