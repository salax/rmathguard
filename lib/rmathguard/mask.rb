module RMathGuard
	module Mask
		PATTERN = ('A'..'Z').to_a + (1..9).to_a

		def masked
			self.each_index do |row|
				self[row].each_index do |col|
					self[row][col] = PATTERN[rand(PATTERN.size)] unless self[row][col] == 0
				end
			end
		end
	end
end
