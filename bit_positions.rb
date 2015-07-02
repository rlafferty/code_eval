def compare_bits(num, position1, position2)
	binary = num.to_s(2)
	binary[-position2] == binary[-position1]
end

File.foreach(ARGV[0]) do |line|
	arr = line.split(',')
	arr.map!(&:to_i)
	puts compare_bits(*arr)
end