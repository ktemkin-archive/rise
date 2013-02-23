# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rise/version'

Gem::Specification.new do |gem|
  gem.name          = "rise"
  gem.version       = Rise::VERSION
  gem.authors       = ["Kyle J. Temkin"]
  gem.email         = ["kyle@ktemkin.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]


  #Gem dependencies
  gem.add_dependency               'rack',      '~>1.5.2'
  gem.add_dependency               'sinatra',   '~>1.3.4'
  gem.add_dependency               'thin',      '~>1.5.0'
  gem.add_dependency               'barista',   '~>1.3.0'
  gem.add_dependency               'sass',      '~>3.2.6'
  gem.add_dependency               'compass',   '~>0.12.2'
  gem.add_dependency               'ruby-adept'
  gem.add_dependency               'ruby-ise'
  gem.add_development_dependency   'rspec',     '~>1.3.0'
  gem.add_development_dependency   'rake',      '~>10.0.3'
  gem.add_dependency               'haml',      '~> 4.0.0'

end
