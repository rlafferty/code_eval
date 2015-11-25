File.open(ARGV[0], 'r').each_line do |line|
  puts line.to_s.swapcase
end
