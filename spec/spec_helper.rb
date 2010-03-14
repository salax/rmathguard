$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'spec'
require 'rmathguard'
require 'be_number'

Spec::Runner.configure do |config|
  config.include(BeNumberMatcher)
end

