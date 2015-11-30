def separate_words_and_digits(arr)
  arr.partition { |e| e =~ /[^\d+]/ }  
end

def consolidate_and_format(*arr)
  arr.map { |e| e.join(',') }
end

def join_arrays(arr)
  arr.reject(&:empty?).join('|')
end

ARGF.each_line do |line|
  strings = line.chomp.split(',')
  words, digits = separate_words_and_digits(strings)
  result = consolidate_and_format(words, digits)
  puts join_arrays(result)
end
