# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "slideshare/version"
#require File.expand_path('../lib/slideshare/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "ruby-slideshare"
  s.version     = Slideshare::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John-Alan Simmons"]
  s.email       = ["johnalan@conferencecloud.co"]
  s.homepage    = ""
  s.summary     = %q{Wrapper for the Slideshare API}
  s.description = %q{Wrapper for the Slideshare API - NOTE: This is a fork of github.com/nixmc/Super-Mega-Slideshare}

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('hashie', '~> 3.3.2')
  s.add_runtime_dependency('faraday', '~> 0.5.4')
  s.add_runtime_dependency('faraday_middleware', '~> 0.3.2')
  s.add_runtime_dependency('nokogiri', '~> 1.6')
  s.add_runtime_dependency('multi_xml', '~> 0.2')
end
