# Class to calculate the percent of lower vs. uppercase chars
class LettercaseRatio
  attr_accessor :chars, :lower, :upper

  def initialize(args)
    @chars = args.chomp.split(//)
    # chars can be used > 1.9.3
  end

  def case_count
    regex = /[[:upper:]]/
    @upper = chars.count { |x| regex.match(x) }
    @lower = chars.size - @upper
    self
  end

  def return_percent
    "lowercase: #{format_percent(@lower)} uppercase: #{format_percent(@upper)}"
  end

  def format_percent(val)
    format('%0.2f', (val.to_f / chars.count) * 100)
  end
end

ARGF.each_line do |line|
  text = LettercaseRatio.new(line)
  puts text.case_count.return_percent
end
