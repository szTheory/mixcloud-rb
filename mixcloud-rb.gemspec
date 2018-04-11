Gem::Specification.new do |s|
  s.name        = %q{mixcloud-rb}
  s.version     = '0.0.2'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joao Da Silva", "szTheory"]
  s.email       = %q{joao@codedefinition.com}
  s.homepage    = %q{http://github.com/jsilva/mixcloud-rb/}
  s.summary     = %q{Ruby wrapper for the mixcloud.com API}
  s.description = %q{Ruby wrapper for the mixcloud.com API}
  
  s.add_development_dependency 'hashie', '~> 2.1.2'
  s.add_development_dependency 'httparty', '~> 0.13.7'
  
  s.files         = Dir.glob("{lib}/**/*")
  s.test_files    = Dir.glob("{test}/**/*")
  s.require_paths = ["lib"]
end