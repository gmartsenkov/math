class Matrix
	attr_accessor :input
	attr_reader :row , :column

	def initialize(n)
		@input = n
		@row = @input[0].length
		@column = @input.length
	end
	def to_a
		@input
	end	
	def self.[](*args)
		return Matrix.new(args)
	end

	def ==(n)
		is_matrix(n)
		n == @input ? true : false
	end

	def +(n)
		n = is_matrix(n)
		if valid?(n)
			column = n.length
			row = n[0].length
			output = n
			(column).times do |column|
				(row).times do |row|
					output[column][row] = @input[column][row] + n[column][row]
				end
			end
		else
			raise 'ErrDimensionMismatch'
		end
		return Matrix.new(output)
	end

	def -(n)
		n = is_matrix(n)
		if valid?(n)
			column = n.length
			row = n[0].length
			output = n
			(column).times do |column|
				(row).times do |row|
					output[column][row] = @input[column][row] - n[column][row]
				end
			end
		else
			raise 'ErrDimensionMismatch'
		end
		return Matrix.new(output)
	end

	def transpose
		output = Array.new
		@column.times do |column|
			@row.times do |row|
			output[row] ||= []
			output[row][column] = @input[column][row]
			end
		end
		return Matrix.new(output)
	end

	def self.zero(colrow)
		output = []
		colrow.times do |column|
			colrow.times do |row|
			output[column] ||= []
			output[column][row] = 0
			end
		end
		return Matrix.new(output)
	end

	def normal?
		@row == column ? true : false
	end

	private

	def valid?(n)
		n = is_matrix(n)
		output = true
		if @column == n.length
		@column.times do |col|
			output = false unless @input[col].length == n[col].length
		end
		end
		output
	end

	def is_matrix(n)
		if n.is_a? Matrix
			return n.input
		else
			return n
		end
	end

end
