# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_helper_anywhere/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_helper_anywhere'
  spec.version       = RailsHelperAnywhere::VERSION
  spec.authors       = ['Josh Cavin']
  spec.email         = ['josh@dreamingblue.com']

  spec.summary       = 'Use rails helpers anywhere.'
  spec.description   = 'Use helpers anywhere with the Helper class.'
  spec.homepage      = 'https://github.com/jwipeout/rails-helper-anywhere'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rails', '~> 5.1.2'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
end
