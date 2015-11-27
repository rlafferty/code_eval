SYMBOLS = [[1000, 'M'],
           [900, 'CM'],
           [500, 'D'],
           [400, 'CD'],
           [100, 'C'],
           [90, 'XC'],
           [50, 'L'],
           [40, 'XL'],
           [10, 'X'],
           [9, 'IX'],
           [5, 'V'],
           [4, 'IV'],
           [1, 'I']]

ARGF.each_line do |line|
  number = line.to_i
  roman = SYMBOLS.each_with_object '' do |(divisor, letter), memo|
    div, number = number.divmod(divisor)
    memo << letter * div
  end
  puts roman
end
