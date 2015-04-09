require "first_gem/version"
class Vector
	attr_accessor :input

	def initialize(v)
		@input = v
	end

	def to_a
		@input
	end

	def magnitude
		r = @input.inject(0) { |accummulator,v| accummulator += v**2 }
		return Math::sqrt(r)
	end

	def +(n)
		n = if_vector(n)
		output = []
			if @input.length == n.length
				@input.length.times do |x|
					output << @input[x] + n[x]
				end
			end
		return Vector.new(output)
	end

	def -(n)
		n = if_vector(n)
		output = []
			if @input.length == n.length
				@input.length.times do |x|
					output << @input[x] - n[x]
				end
			end
		return Vector.new(output)
	end

	def scale_by(n)
		output = []
		@input.each {|x| output << x*n}
		return Vector.new(output)
	end

	def distance_to(n)
		n = if_vector(n)
		if @input.length == n.length
			output = 0
			@input.length.times {|i| output += (@input[i]-n[i])**2  }
			return Math::sqrt(output)
		end
	end

	private

	def if_vector(n)
		if n.is_a? Vector
			return n.input
		else
			return n
		end
	end
end

module Probabilities
	def permutation(n,b=nil)
		arr = Array.new
		output = 1
		(1..n).each {|x| arr << x}
		arr.reverse!
		if b == nil
		arr.each {|x| output *= x} 
		else
		(0...b).each {|x| output *= arr[x]}	
		end
		return output
	end

	def combinations(n,b=nil)
		output = (permutation(n) / permutation(n - b)) / permutation(b) 
		return output
	end
end
