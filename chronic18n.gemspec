# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "chronic18n"
  s.version = "0.0.4"
  s.authors = ["Marcos Piccinini"]
  s.date = "2012-01-05"
  s.description = "One 'way' to i18n chronic"
  s.email = "x@nofxx.com"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.homepage = "http://github.com/nofxx/chronic18n"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.12"
  s.summary = "i18n chronic"

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  s.add_development_dependency 'jeweler'
  s.add_dependency 'chronic'
  s.add_dependency 'countries'
  s.add_dependency 'cld3'
end
