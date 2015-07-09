def self_describing?(number)
	digits = number.to_s.chars.collect { |x| x.to_i }
	number_length = digits.length
	number_count = Array.new(number_length, 0)

	digits.each do |digit|
		return false if digit >= number_length
		number_count[digit] = number_count[digit] + 1
	end

	digits.eql? number_count
end

File.open(ARGV[0], "r").each_line do |line|
	number = line.chomp
	puts self_describing?(number) ? 1 : 0
end