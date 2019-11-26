# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "chronic18n"
  s.version = "0.1.0"
  s.authors = ["Jora team", "Marcos Piccinini"]
  s.summary = "i18n chronic"
  s.description = "One 'way' to i18n chronic"
  s.email = "hello@jora.com"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.homepage = "https://github.com/jobseekerltd/chronic18n"
  # s.homepage = "http://github.com/nofxx/chronic18n"

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  s.add_dependency 'chronic'
  s.add_dependency 'countries'
  s.add_dependency 'cld'
end
