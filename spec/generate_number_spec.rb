$:.unshift File.dirname(__FILE__)

require 'spec_helper'

describe RMathGuard::Numbers do
	it 'should generate number zero' do
		RMathGuard::Numbers::ZERO.should be_zero
	end

	it 'should generate number one' do
		RMathGuard::Numbers::ONE.should be_one
	end

	it 'should generate number two' do
		RMathGuard::Numbers::TWO.should be_two
	end

	it 'should generate number three' do
		RMathGuard::Numbers::THREE.should be_three
	end

	it 'should generate number four' do
		RMathGuard::Numbers::FOUR.should be_four
	end

	it 'should generate number five' do
		RMathGuard::Numbers::FIVE.should be_five
	end

	it 'should generate number six' do
		RMathGuard::Numbers::SIX.should be_six
	end

	it 'should generate number seven' do
		RMathGuard::Numbers::SEVEN.should be_seven
	end

	it 'should generate number eight' do
		RMathGuard::Numbers::EIGHT.should be_eight
	end

	it 'should generate number nine' do
		RMathGuard::Numbers::NINE.should be_nine
	end
end
