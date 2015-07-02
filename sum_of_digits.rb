def split_num(str)
	arr = str.split(//)
end

def add_digits(arr)
	arr.map(&:to_i).inject(&:+)
end

File.foreach(ARGV[0]) do |line|
	arr = split_num(line)
	puts add_digits(arr)
end