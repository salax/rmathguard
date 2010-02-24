module RMathGuard
	class Expression
		OPERANDS = %w[ZERO ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE]
		OPERATORS = {"+" => "PLUS",
      "-" => "MINUS"}

		attr_reader :result

		def initialize(options = {})
			@max_value = options[:max_value] || 10
			@row_count = options[:row_count] || 5
			@col_count = options[:col_count] || 3
			@sep_size  = options[:sep_size]  || 2

      RMathGuard::Numbers.resize(@row_count, @col_count)
      RMathGuard::Operators.resize(@row_count, @col_count)
			generate
		end

		def show
			n = RMathGuard::Numbers
			op1 = n.const_get(OPERANDS[@operand1]).masked
			op2 = n.const_get(OPERANDS[@operand2]).masked
      o = RMathGuard::Operators
			sign = o.const_get(OPERATORS[@operator]).masked
			eq = o::EQUALS.masked


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
			@operator = %w(- +)[rand(2)]
			@operand1 = rand(@max_value)
			@operand2 = rand(@max_value)
			@result = eval("#{@operand1}#{@operator}#{@operand2}")
		end
	end
end