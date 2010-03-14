$:.unshift File.dirname(__FILE__)

require 'spec_helper'

describe RMathGuard::Expression do
  it "should successfully create expression" do
    50.times do
      lambda { RMathGuard::Expression.new }.should_not raise_error
    end
  end
end
