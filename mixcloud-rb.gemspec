$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'bundler'
require 'bundler/version'
require 'mixcloud'

Gem::Specification.new do |s|
  s.name = %q{mixcloud-rb}
  s.version = MixCloud::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_rubygems_version = ">= 1.3.6"
  s.authors = ["Joao Da Silva", "szTheory"]
  s.date = %q{2018-04-10}
  s.description = %q{Ruby wrapper for the mixcloud.com API}
  s.email = %q{joao@codedefinition.com}
  s.files = Dir.glob("{lib}/**/*")
  s.homepage = %q{http://github.com/jsilva/mixcloud-rb/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Ruby wrapper for the mixcloud.com API}
  s.test_files = Dir.glob("{test}/**/*")

  s.add_development_dependency 'hashie', '~>0.2.0'
  s.add_development_dependency 'httparty', '~>0.13.7'
end