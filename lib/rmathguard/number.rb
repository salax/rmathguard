module RMathGuard
	class Number

		include RMathGuard::Mask

		def initialize(rows = 5, columns = 3)
			@rows = rows
			@columns = columns

			generate_rows
			generate_columns
			generate_half_columns
		end

		def blank
			Array.new(@rows) { Array.new(@columns, 0) }
		end

		def middle
			(@rows / 2.0).round
		end

		def generate_rows
			@single_rows = []
			0.upto(@rows - 1) do |n|
				@single_rows[n] = blank
				@single_rows[n].each_index do |row|
					@single_rows[n][row].each_index do |col|
						@single_rows[n][row][col] = 1 if row == n
					end
				end
			end
		end

		def generate_columns
			@single_columns = []
			(0...@columns).each do |n|
				@single_columns[n] = blank
				@single_columns[n].each_index do |row|
					@single_columns[n][row].each_index do |col|
						@single_columns[n][row][col] = 1 if col == n
					end
				end
			end
		end

		def generate_half_columns
			@half_columns = {
				:top_left => blank.fill([1, 0, 0], 0..1),
				:top_right => blank.fill([0, 0, 1], 0..1),
				:bottom_left => blank.fill([1, 0, 0], 3..3),
				:bottom_right => blank.fill([0, 0, 1], 3..3)
			}
		end

		def merge(*args)
			res ||= blank
			(0...args.size).each do |i|
				first = args[i]
				first.each_index do |row|
					first[row].each_index do |col|
						res[row][col] = 1 if first[row][col] == 1
					end
				end
			end
			res
		end
		
		def equals_sign
			merge(@single_rows[1], @single_rows[3])
		end

		def plus_sign
			blank.fill([0,1,0], 1..1).
						fill([1,1,1], 2..2).
						fill([0,1,0], 3..3)
		end

		def multiply_sign
			blank.fill([1,0,1], 1..1).
						fill([0,1,0], 2..2).
						fill([1,0,1], 3..3)
		end

		def minus_sign
			@single_rows[2]
		end

    def zero
			merge(@single_rows.first, @single_rows.last, @single_columns.first, @single_columns.last)
		end

		def one
			@single_columns.last
		end

		def two
			merge(@single_rows.first, @single_rows[2], @single_rows.last, @half_columns[:top_right], @half_columns[:bottom_left])
		end

		def three
			merge(@single_rows.first, @single_rows[2], @single_rows.last, @single_columns.last)
		end

		def four
			merge(@single_rows[2], @single_columns.last, @half_columns[:top_left])
		end

		def five
			merge(@single_rows.first, @single_rows[2], @single_rows.last, @half_columns[:top_left], @half_columns[:bottom_right])
		end

		def six
			merge(five, @half_columns[:bottom_left])
		end

		def seven
			merge(one, @single_rows.first)
		end

		def eight
			merge(@single_columns.first, three)
		end

		def nine
			merge(five, @half_columns[:top_right])
		end
	end
end
