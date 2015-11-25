UPPER = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
LOWER = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
LOOKUP = UPPER.zip(LOWER).each_with_object({}) do |pair, hash|
  hash[pair.first.to_sym] = pair.last
  hash[pair.last.to_sym] = pair.first
end

File.open(ARGV[0], 'r').each_line do |line|
  letters = line.to_s.chars
  swapped = letters.map { |letter| LOOKUP[letter.to_sym] || letter }
  puts swapped.join('')
end
