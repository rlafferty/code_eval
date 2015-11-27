def find_repetition(str)
  substring = ''
  str.each_char do |c|
    substring << c
    return substring.length if repeatable?(str, substring)
  end
end

def repeatable?(str, substring)
  repeat_num = str.length / substring.length
  str.eql?(substring * repeat_num)
end

ARGF.each_line do |line|
  puts find_repetition line.chomp
end
