require 'rmathguard/digit'
require 'rmathguard/number'
require 'rmathguard/expression'

module RMathGuard
	VERSION = "0.1.0"
end

puts RMathGuard::Expression.new.show
#p RMathGuard::Numbers::TWO.masked
#p RMathGuard::Numbers::TWO
