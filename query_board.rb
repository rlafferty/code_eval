class QueryBoard
	attr_reader :arr

	def initialize
		@arr = Array.new(256) { |i| Array.new(256) { |i| 0 } }	
	end

	def set_row(rownum, value)
		arr[rownum.to_i].map! { |x| x = value.to_i }
		# puts rownum
		# puts value
	end

	alias_method :setrow, :set_row

	def set_col(colnum, value)
		arr.map { |row| row[colnum.to_i] = value.to_i }
		# puts colnum
		# puts value
	end

	alias_method :setcol, :set_col

	def query_row(rownum)
		puts arr[rownum.to_i].inject(&:+)
		# puts arr[rownum.to_i].inspect
	end

	alias_method :queryrow, :query_row

	def query_col(colnum)
		vals = arr.collect { |row| row[colnum.to_i] }
		puts vals.inject(&:+)
	end

	alias_method :querycol, :query_col

end

matrix = QueryBoard.new()

File.open(ARGV[0], "r").each_line do |line|
	x = line.chomp.split(' ')
	method = x.shift.downcase
	matrix.send method.to_sym, *x
end

# puts matrix.arr.inspect
