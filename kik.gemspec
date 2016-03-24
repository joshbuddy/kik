# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kik/version'

Gem::Specification.new do |spec|
  spec.name          = "kik"
  spec.version       = Kik::VERSION
  spec.authors       = ["Joshua Hull"]
  spec.email         = ["joshbuddy@gmail.com"]

  spec.summary       = %q{ kik off a process if no listener exists on a port}
  spec.description   = %q{ kik off a process if no listener exists on a port.}
  spec.homepage      = "https://github.com/joshbuddy/kik"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
