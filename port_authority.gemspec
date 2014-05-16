# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'port_authority/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Shaun Dern"]
  spec.email         = ["shaun@substantial.com"]

  spec.name          = "port_authority"
  spec.version       = PortAuthority::VERSION
  spec.description   = %q{Transfer remote files.}
  spec.summary       = %q{Transfer remote files.}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake", "~> 10.3"

  spec.add_dependency "net-sftp", "~> 2.1"
  spec.add_dependency "ruby-progressbar", "~> 1.5.1"
end

