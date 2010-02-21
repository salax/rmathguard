$:.unshift File.dirname(__FILE__)

require 'spec_helper'

describe RMathGuard::Number do
	before do
		@number = RMathGuard::Number.new
	end

	it 'should generate number zero' do
		@number.zero.should be_zero
	end

	it 'should generate number one' do
		@number.one.should be_one
	end

	it 'should generate number two' do
		@number.two.should be_two
	end

	it 'should generate number three' do
		@number.three.should be_three
	end

	it 'should generate number four' do
		@number.four.should be_four
	end

	it 'should generate number five' do
		@number.five.should be_five
	end

	it 'should generate number six' do
		@number.six.should be_six
	end

	it 'should generate number seven' do
		@number.seven.should be_seven
	end

	it 'should generate number eight' do
		@number.eight.should be_eight
	end

	it 'should generate number nine' do
		@number.nine.should be_nine
	end
end
