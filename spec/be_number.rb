module BeNumberMatcher
	class Number
		ZERO = [[1, 1, 1],
						[1, 0, 1],
						[1, 0, 1],
						[1, 0, 1],
						[1, 1, 1]]

		ONE = [[0, 0, 1],
					 [0, 0, 1],
					 [0, 0, 1],
					 [0, 0, 1],
					 [0, 0, 1]]

		TWO = [[1, 1, 1],
		       [0, 0, 1],
			  	 [1, 1, 1],
			     [1, 0, 0],
				   [1, 1, 1]]

		THREE = [[1, 1, 1],
		      	 [0, 0, 1],
			  		 [1, 1, 1],
			    	 [0, 0, 1],
				  	 [1, 1, 1]]

		FOUR = [[1, 0, 1],
			   	  [1, 0, 1],
					  [1, 1, 1],
					  [0, 0, 1],
					  [0, 0, 1]]

		FIVE = [[1, 1, 1],
					  [1, 0, 0],
					  [1, 1, 1],
					  [0, 0, 1],
					  [1, 1, 1]]
		
		SIX = [[1, 1, 1],
					 [1, 0, 0],
					 [1, 1, 1],
					 [1, 0, 1],
					 [1, 1, 1]]

		SEVEN = [[1, 1, 1],
					   [0, 0, 1],
					   [0, 0, 1],
					   [0, 0, 1],
					   [0, 0, 1]]

		EIGHT = [[1, 1, 1],
					   [1, 0, 1],
					   [1, 1, 1],
					   [1, 0, 1],
					   [1, 1, 1]]

		NINE = [[1, 1, 1],
					  [1, 0, 1],
					  [1, 1, 1],
					  [0, 0, 1],
					  [1, 1, 1]]

		def initialize(expected)
			@expected = expected
		end

		def matches?(target)
			@target = target
			@target.eql?(@expected)
		end
	end

	def be_zero
		Number.new(Number::ZERO)
	end

	def be_one
		Number.new(Number::ONE)
	end

	def be_two
		Number.new(Number::TWO)
	end

	def be_three
		Number.new(Number::THREE)
	end

	def be_four
		Number.new(Number::FOUR)
	end

	def be_five
		Number.new(Number::FIVE)
	end

	def be_six
		Number.new(Number::SIX)
	end

	def be_seven
		Number.new(Number::SEVEN)
	end

	def be_eight
		Number.new(Number::EIGHT)
	end

	def be_nine
		Number.new(Number::NINE)
	end
end
