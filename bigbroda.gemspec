# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bigbroda/version'

Gem::Specification.new do |spec|
  spec.name          = "bigbroda"
  spec.version       = BigBroda::VERSION
  spec.authors       = ["miguel michelson"]
  spec.email         = ["miguelmichelson@gmail.com"]
  spec.description   = "GoogleBigQuery ActiveRecord Adapter & standalone API client"
  spec.summary       = "This library is build on top of google-api-client, ActiveRecord >4 compatible"
  spec.homepage      = "https://github.com/michelson/BigBroda"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", ">= 3.0.0"

  spec.add_runtime_dependency("google-api-client")

  spec.add_dependency "hash-deep-merge"
  spec.add_dependency "activesupport"
  spec.add_dependency "activerecord"
end
