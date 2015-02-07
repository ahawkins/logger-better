require 'logger'

class NullLogger < Logger
  def initialize(*args)

  end

  # All other methods (debug/info) etc use add internally.
  # It's the lowest level public interface.
  def add(severity, message = nil, progname = nil)
    yield if message.nil? && block_given?
  end
end
