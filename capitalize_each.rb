File.open(ARGV[0], 'r').each_line do |line|
  words = line.chomp.split(' ')
  puts words.map { |word| word[0].upcase + word[1..-1] }.join(' ')
end
