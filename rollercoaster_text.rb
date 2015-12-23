ARGF.each_line do |line|
  puts line.chomp
    .gsub(/[[:alpha:]]/)
    .with_index { |s, i| i.even? ? s.upcase : s.downcase }
end
