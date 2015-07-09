def is_armstrong?(num)
	digits = num.to_s.chars.collect { |x| x.to_i }
	len = digits.length
	armostrong_total = digits.inject(0) { |sum, x| sum + (x**len) }
	num.to_i.eql? armostrong_total
end

File.open(ARGV[0], "r").each_line do |line|
	num = line.chomp
	puts is_armstrong?(num).to_s.capitalize
end