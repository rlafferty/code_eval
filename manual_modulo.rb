File.open(ARGV[0], "r").each_line do |line|
	numerator, denominator = line.chomp.split(/,/).map(&:to_i)
	times = numerator / denominator
	remainder = numerator - (denominator * times)
	puts remainder
end