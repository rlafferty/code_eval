NUMERALS = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
LETTERS = %w(M CM D CD C XC L XL X IX V IV I)
ROMAN = NUMERALS.zip LETTERS

def convert_to_numerals(number)
  return '' if number.zero?
  ROMAN.each do |numeric, roman|
    return roman + convert_to_numerals(number - numeric) if number >= numeric
  end
end

ARGF.each_line do |line|
  num = line.to_i
  puts convert_to_numerals(num)
end
