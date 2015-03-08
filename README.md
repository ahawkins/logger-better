# logger-better

Simple `Logger` subclasses to make it easier to use and print more
compact log messages. It also contains modules you can monkey patch
into `Logger` if you don't want to use the subclasses, or don't have
control over objects instantiating `Logger` instances.

I wrote this gem because I've done this same basic thing in many
projects and got tired of it.

## Installation

Add this line to your application's Gemfile:

    gem 'logger-better'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logger-better

## Enhancements

* Default log format is more readable: `2013-08-10T15:19:21Z [app#68530]  INFO: hi`
* Includes a formatter without timestamps. Useful when your logging
  solution automatically inserts them.
* Set `logger.level` with symbols. `logger.level = :info` (Works
  nicely with `ENV['LOG_LEVEL']`)
* Provide a `NullLogger` object to be used in cases where you need to
  tell some code to shut up.

## Usage

logger-better has two modes: subclasses and monkey patches to the
`Logger` class. Monkey patching is **OPT IN**. This library includes a
`Logger::Better` subclass. It just a subclass with the appropriate
modules included. `Logger::Better` instances will use bundled
formatter by default. `Logger::Better` also provides a factory for
creating timestampless loggers (using one of the bundled formatters).

### Sublcass Usage

```ruby
require 'logger-better'

logger = Logger::Better.new $stdout
logger.info('testing') { 'Hello World' } # => 2013-08-10T15:19:21Z [app#68530]  INFO: Hello World

# Notimestamp factory method behaves the same as new, just sets the
# default formatter
logger = Logger::Better.no_timestamp $stdout
logger.info('testing') { 'Hello World' } # => [app#68530]  INFO: Hello World
```

### Monkey Patching Logger

```ruby
require 'logger/better'

logger = Logger.new $stdout
logger.info('testing') { 'Hello World' } # => 2013-08-10T15:19:21Z [app#68530]  INFO: Hello World

require 'logger/no_timestamp'

# Notimestamp factory method behaves the same as new, just sets the
# default formatter
logger = Logger.new $stdout
logger.info('testing') { 'Hello World' } # => [app#68530]  INFO: Hello World
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
