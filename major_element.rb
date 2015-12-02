# class to find the element with the highest numerical value that
# appears more than 50% of the time in a series of numbers
class MajorElement
  attr_reader :histogram, :threshold

  def initialize(args)
    @histogram = find_frequency(args)
    @threshold = args.size / 2
  end

  def find_frequency(arr)
    arr.map(&:to_i).each_with_object(Hash.new(0)) do |e, a|
      a[e] += 1
    end
  end

  def find_max_element
    element, occurences = @histogram.max_by { |_, v| v }
    return element if occurences > @threshold
    'None'
  end
end

ARGF.each_line do |line|
  data = line.chomp.split(',')
  hist = MajorElement.new(data)
  puts hist.find_max_element
end
