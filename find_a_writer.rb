File.open(ARGV[0], 'r').each_line do |line|
  next if line.chomp.empty?
  chars, keys = line.split('|').map(&:strip)
  keymap = keys.split(' ').map { |e| e.to_i - 1 }
  author = keymap.inject([]) { |a, e| a. << chars[e] }
  puts author.join
end
