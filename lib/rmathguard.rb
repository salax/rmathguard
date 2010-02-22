require 'rmathguard/mask'
require 'rmathguard/number'
require 'rmathguard/expression'

module RMathGuard
	VERSION = "0.0.5"
end

n = RMathGuard::Number.new
p n.mask(:one)
puts
p n.mask(:eight)
