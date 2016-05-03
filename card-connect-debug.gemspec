# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'card-connect-debug/version'

Gem::Specification.new do |spec|
  spec.name          = "card-connect-debug"
  spec.version       = CardConnect::Debug::VERSION
  spec.authors       = ["Derek Victory"]
  spec.email         = ["derekvictory@yahoo.com"]

  spec.summary       = %q{Debug Card Connect}
  spec.description   = %q{Debug Card Connect}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
