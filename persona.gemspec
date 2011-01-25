# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "persona/version"

Gem::Specification.new do |s|
  s.name        = "persona"
  s.version     = Persona::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Filippo Diotalevi"]
  s.email       = ["filippo.diotalevi@gmail.com"]
  s.homepage    = "https://github.com/fdiotalevi/persona-cms"
  s.summary     = %q{Minimal personal content manager}
  s.description = %q{A minimal personal content manager}

  s.add_dependency('sinatra', '>= 1.1.0')
  s.add_dependency('rake', '>= 0.8.3')  

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end