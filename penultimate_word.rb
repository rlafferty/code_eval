File.open(ARGV[0], 'r').each_line do |line|
  puts line.split(' ').at(-2)
end
