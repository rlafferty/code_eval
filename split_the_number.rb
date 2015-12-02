# Class for the inputs numbers and arithimatic mask
class SplitTheNumber
  def initialize(text)
    @inputs, @operators = text.split(' ')
    @mask = parse_mask
    @nums = split_numbers
  end

  def parse_mask
    @operators.split(/([+-])/)
  end

  def split_numbers
    @inputs.split(/(^.{1,#{@mask.first.size}})/).reject(&:empty?).map(&:to_i)
  end

  def do_math
    @nums.first.public_send(@mask[1].to_sym, @nums.last)
  end
end

ARGF.each_line do |line|
  num_mask = SplitTheNumber.new(line.chomp)
  puts num_mask.do_math
end
