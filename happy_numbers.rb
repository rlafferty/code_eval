PROCESSED_NUMBERS = []
HAPPY_NUMBERS = []

def happy?(num)
	return true if num == 1
	return HAPPY_NUMBERS.include?(num) if PROCESSED_NUMBERS.include?(num)

	PROCESSED_NUMBERS << num.to_i
	sum = sum_of_digits_squared(num)

	if happy?(sum)
		HAPPY_NUMBERS << num.to_i
		true
	else
		false
	end
end

def sum_of_digits_squared(digit)
	digit.to_s.chars.inject(0) { |sum, x| sum + x.to_i**2 }
end

File.open(ARGV[0]).each_line do |line|
	num = line.chomp
	puts happy?(num) ? 1 : 0
end

	puts "Happy Numbers: #{HAPPY_NUMBERS}"
	puts "PROCESSED_NUMBERS: #{PROCESSED_NUMBERS}"
