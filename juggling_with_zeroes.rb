# Class to convert a "base 0" fake math into base 10 integers
class BaseZero
  attr_reader :pairs

  def initialize(text)
    @pairs = split_pairs(text)
  end

  def split_pairs(str)
    str.split(' ').each_slice(2).map { |x| x.join(' ') }
  end

  def process_base_zero
    binary = ''
    pairs.each { |x| binary << parse_binary(x) }
    binary_to_int(binary)
  end

  def parse_binary(pair)
    flag, value = pair.split(' ')
    return value if flag == '0'
    multiple_ones(value) if flag == '00'
  end

  def multiple_ones(num)
    '1' * num.length
  end

  def binary_to_int(val)
    val.to_i(2)
  end
end

ARGF.each_line do |line|
  text = BaseZero.new(line)
  puts text.process_base_zero
end
