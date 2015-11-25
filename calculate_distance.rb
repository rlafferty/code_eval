Point = Struct.new(:x, :y)

def parse_numbers(text)
  text.scan(/[-\d]+/)
end

def split_array(arr)
  arr.partition.with_index { |_, i| i < 2 }
end

def calculate_distance(arr)
  f_point, s_point = arr.map { |e| Point.new(e.first.to_i, e.last.to_i) }
  total = (s_point[:x] - f_point[:x])**2 + (s_point[:y] - f_point[:y])**2
  Math.sqrt(total)
end

File.open(ARGV[0], 'r').each_line do |line|
  numbers = parse_numbers(line)
  split_numbers = split_array(numbers)
  puts calculate_distance(split_numbers).to_i
end
