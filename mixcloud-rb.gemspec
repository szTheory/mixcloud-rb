# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'mixcloud'

Gem::Specification.new do |s|
  s.name        = %q{mixcloud-rb}
  s.version     = MixCloud::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joao Da Silva", "szTheory"]
  s.email       = %q{joao@codedefinition.com}
  s.homepage    = %q{http://github.com/jsilva/mixcloud-rb/}
  s.summary     = %q{Ruby wrapper for the mixcloud.com API}
  s.description = %q{Ruby wrapper for the mixcloud.com API}
  
  s.add_development_dependency 'hashie', '~>0.2.0'
  s.add_development_dependency 'httparty', '~>0.13.7'
  
  s.files         = Dir.glob("{lib}/**/*")
  s.test_files    = Dir.glob("{test}/**/*")
  s.require_paths = ["lib"]
end