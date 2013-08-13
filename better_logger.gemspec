# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "better_logger"
  spec.version       = BetterLogger::VERSION
  spec.authors       = ["ahawkins"]
  spec.email         = ["me@broadcastingadam.com"]
  spec.description   = %q{Simple monkey patch to stdlib's Logger to make it easier to use.}
  spec.summary       = %q{Simple monkey patch to stdlib's Logger to make it easier to use.}
  spec.homepage      = "https://github.com/ahawkins/better_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
