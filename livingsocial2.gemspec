# -*- encoding: utf-8 -*-
require File.expand_path('../lib/livingsocial2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["michael verdi"]
  gem.email         = ["michael.v.verdi@gmail.com"]
  gem.description   = %q{Wrapper for the livingsocial atom feed}
  gem.summary       = %q{Wrapper for the livingsocial atom feed}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "livingsocial2"
  gem.require_paths = ["lib"]
  gem.version       = Livingsocial2::VERSION

  gem.add_development_dependency('rspec')
  gem.add_runtime_dependency('mongoid')
  gem.add_runtime_dependency('bson_ext')
end
