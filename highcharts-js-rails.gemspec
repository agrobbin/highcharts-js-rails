# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'highcharts/version'

Gem::Specification.new do |s|
  s.name        = 'highcharts-js-rails'
  s.version     = Highcharts::VERSION
  s.authors     = ['Alex Robbin']
  s.email       = ['agrobbin@gmail.com']
  s.homepage    = 'http://github.com/agrobbin/highcharts-js-rails'
  s.summary     = %q{Easily configure a Highcharts JS chart for use in a Rails application}
  s.description = s.summary

  s.rubyforge_project = 'highcharts-js-rails'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_dependency 'actionpack', '~> 3.0'
end
