# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "logger-better"
  spec.version       = "0.2.0"
  spec.authors       = ["ahawkins"]
  spec.email         = ["adam@hawkins.io"]
  spec.description   = %q{Simple monkey patch to stdlib's Logger to make it easier to use.}
  spec.summary       = %q{Simple monkey patch to stdlib's Logger to make it easier to use.}
  spec.homepage      = "https://github.com/ahawkins/logger-better"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
