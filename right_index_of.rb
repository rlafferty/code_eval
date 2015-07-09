def find_right_char(text, char)
	found = text.rindex(char)
	return -1 if not found
	return found
end

File.open(ARGV[0]).each_line do |line|
	values = line.chomp.split(/,/)
	text, char_to_find = values[0], values[1]
	puts find_right_char(text, char_to_find)
end