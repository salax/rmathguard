$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec'
require 'rmathguard'
require 'be_number'

RSpec.configure do |config|
  config.include(BeNumberMatcher)
end
