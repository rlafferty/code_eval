def find_longest(words)
  words.inject { |a, e| a.length < e.length ? e : a }
end

ARGF.each_line do |line|
  words = line.chomp.split(' ')
  puts find_longest(words)
end
