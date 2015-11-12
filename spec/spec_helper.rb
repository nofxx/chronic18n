$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'chronic18n'

HOUR = HOURS = 3600
DAY = DAYS = 86400

def get_time(t)
  Time.at(Time.now + t)
end

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
