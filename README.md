# logger-better

Simple monkey patch to stdlib's `Logger` to make it easier to use.

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
* Set `logger.level` with symbols. `logger.level = :info`
* Provide a `NullLogger` object to be used in cases where you need to
  tell some code to shut up.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
