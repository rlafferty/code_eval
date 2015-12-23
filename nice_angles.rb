# Class to take a degree representation and store degrees, minutes, seconds
class NiceAngles
  attr_reader :degrees, :minutes, :seconds
  def initialize(args)
    @degrees, @minutes, @seconds = degree_minute_second(args.to_f)
  end

  def degree_minute_second(value)
    degrees = value.to_i
    minutes = (value % 1) * 60
    seconds = (minutes % 1) * 60
    [degrees, minutes, seconds]
  end

  def pretty_print_angle
    "#{degrees}.#{format('%02d', minutes)}'#{format('%02d', seconds)}\""
  end
end

ARGF.each_line do |line|
  obj = NiceAngles.new(line.chomp)
  # binding.pry
  puts obj.pretty_print_angle
end
