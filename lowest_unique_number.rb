# Class to hold the frequency hash for an array of numbers
class LowestUniqueNumber
  def initialize(numbers)
    @hash = numbers.each_with_object(Hash.new(0)) { |e, a| a[e] += 1 }
  end

  def lowest
    @lowest ||= find_lowest
  end

  private

  def find_lowest
    @hash.select { |_k, v| v == 1 }.keys.sort.first || 0
  end
end

File.foreach(ARGV[0]) do |line|
  numbers = line.chomp.split(' ').map(&:to_i)
  histogram = LowestUniqueNumber.new numbers
  puts numbers.index(histogram.lowest) + 1
end
