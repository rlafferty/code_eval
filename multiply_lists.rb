ARGF.each_line do |line|
  first_list, second_list = line.split(' | ').map do |e|
    e.split(' ').map(&:to_i)
  end
  result = first_list.zip(second_list).map { |x| x.reduce(&:*)}
  puts result.join(' ')
end