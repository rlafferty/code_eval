WORDS = %w(zero one two three four five six seven eight nine)

File.foreach(ARGV[0]) do |line|
  input_words = line.chomp.split(';')
  digits = input_words.map { |x| WORDS.index x }
  puts digits.join
end
