File.open(ARGV[0]).each_line do |line|
	arr = line.split(/[;,]/)
	puts arr.sort.find_all { |e| arr.count(e) > 1 }.uniq.join(',')
	#puts result unless result.empty?
end


# File.open(ARGV[0]).each_line do |line|
# 	arr = line.split(/;/)
# 	array_1 = arr[0].split(/,/)	
# 	array_2 = arr[1].split(/,/)
# 	print (array_1 & array_2).join(',')
# 	print "\n"
# 	#puts result unless result.empty?
# end