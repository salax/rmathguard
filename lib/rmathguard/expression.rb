module RMathGuard
	class Expression
		OPERANDS = %w[zero one two three four five six seven eight nine]
		OPERATORS = {"*" => :multiply_sign,
								 "+" => :plus_sign,
								 "-" => :minus_sign}

		attr_reader :result

		def initialize(options = {})
			@max_value = options[:max_value] || 10
			@row_count = options[:row_count] || 5
			@col_count = options[:col_count] || 3
			@sep_size  = options[:sep_size]  || 1

			generate
		end

		def show
			n = RMathGuard::Number.new(@row_count, @col_count)
			op1 = n.send(:mask, OPERANDS[@operand1])
			op2 = n.send(:mask, OPERANDS[@operand2])
			sign = n.send(:mask, OPERATORS[@operator])
			eq = n.mask(:equals_sign)

			result = []
			(0...@row_count).each do |row|
				result[row] = []
				result[row] << op1[row]
				@sep_size.times { result[row] << 0 }
				result[row] << sign[row]
				@sep_size.times { result[row] << 0 }
				result[row] << op2[row]
				@sep_size.times { result[row] << 0 }
				result[row] << eq[row]
				result[row].flatten!
			end
			result.map { |row| row.join("") }.join("\n").tr("0", " ")
		end

		private
		def generate
			@operator = %w(* - +)[rand(3)]
			@operand1 = rand(@max_value)
			@operand2 = rand(@max_value)
			@result = eval("#{@operand1}#{@operator}#{@operand2}")
		end
	end
end
