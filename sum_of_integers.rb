DIGITS = []

File.foreach(ARGV[0]) do |line|
	DIGITS << line.to_i
end

puts DIGITS.inject(&:+)