require 'chronic18n'
require 'timecop'
require 'pry-byebug'

HOUR = HOURS = 3600
DAY = DAYS = 86400

def get_time(t)
  Time.at(Time.now + t)
end

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
