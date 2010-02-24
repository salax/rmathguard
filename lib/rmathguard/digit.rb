module RMathGuard
	class Digit < Array
		PATTERN = ('A'..'Z').to_a + (1..9).to_a

		def initialize(rows, columns)
			super(rows) { Array.new(columns, 0) }
		end

		def self.build(rows = 5, columns = 3, &blk)
			digit = Digit.new(rows, columns)
			digit.instance_eval(&blk)
      digit
		end

		def build(&blk)
			digit = Digit.new(self.size, self.first.size)
			digit.copy(self)
			digit.instance_eval(&blk)
      digit
		end

		def copy(digit)
			digit.each_index do |row|
				digit[row].each_index do |col|
					self[row][col] = digit[row][col]
				end
			end
		end

		def masked
      digit = Digit.new(self.size, self.first.size)
			digit.copy(self)
			digit.each_index do |row|
				digit[row].each_index do |col|
					digit[row][col] = PATTERN[rand(PATTERN.size)] unless digit[row][col] == 0
				end
			end
      digit
		end

		def full_row(position)
			position = case position
      when :top, :first
        0
      when :middle
        (self.size / 2.0).round - 1
      when :bottom, :last
        self.size - 1
      else
        position.to_i
      end
			self[position].fill(1)
		end

		def full_column(position)
			position = case position
      when :last
        self[0].size - 1
      when :first
        0
      end
			self.each_index do |row|
				self[row][position] = 1
			end
		end

		def half_column(position)
			position = case position
      when :top_left
        [0..middle, 0]
      when :top_right
        [0..middle, self.first.size - 1]
      when :bottom_left
        [middle...self.size, 0]
      when :bottom_right
        [middle...self.size, self.first.size - 1]
      end
			position.first.each do |row|
				self[row][position.last] = 1
			end
		end

    def column(position, range)
      range.each do |row|
        self[row][position] = 1
      end
    end

		def middle
			self.size / 2
		end

    def middle_column
      self.first.size / 2
    end
	end
end
