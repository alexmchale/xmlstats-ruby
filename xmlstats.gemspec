# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xmlstats/version'

Gem::Specification.new do |spec|
  spec.name          = "xmlstats"
  spec.version       = Xmlstats::VERSION
  spec.authors       = ["Alex McHale"]
  spec.email         = ["alex@anticlever.com"]
  spec.description   = %q{A ruby client for xmlstats (https://erikberg.com/api).}
  spec.summary       = %q{A ruby client for xmlstats (https://erikberg.com/api).}
  spec.homepage      = "http://github.com/alexmchale/xmlstats-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock", "~> 1.11.0"
end
