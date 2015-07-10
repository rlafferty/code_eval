class BeautifulString
	attr_accessor :str

	def initialize(str)
		@str = str
	end

	def to_s
		str
	end

	def strip_punctuation
		str.downcase.gsub(/[^a-z]/,'')
	end
end

def count_occurences(arr)
	arr.each_with_object(Hash.new(0)) { |i, hash| hash[i] += 1 }
end

def map_values(arr)
	val = (1..26).to_a.reverse
	arr.sort.reverse.zip(val)
end

def total_up_array(multi_arr)
	multi_arr.inject(0) do |total, x|
		total += x.inject(&:*)
	end
end

File.open(ARGV[0], "r").each_line do |line|
	beauty = BeautifulString.new(line.chomp)
	arr = beauty.strip_punctuation.split(//)
  arr = count_occurences(arr).values
  zipped = map_values(arr)
  puts total_up_array(zipped)
end