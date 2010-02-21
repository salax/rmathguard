module RMathGuard
	module Mask
		PATTERN = ('A'..'Z').to_a + (1..9).to_a

		def mask(method_name)
			number = self.send(method_name)
			number.each_index do |row|
				number[row].each_index do |col|
					number[row][col] = PATTERN[rand(PATTERN.size)] if number[row][col] == 1
				end
			end
		end
	end
end
