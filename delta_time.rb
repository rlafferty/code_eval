require 'time'

T = Time.now

ARGF.each_line do |line|
  first_time, second_time = line.split(' ')
  times = [first_time, second_time].map do |time|
    hh, mm, ss = time.scan(/\d+/)
    Time.new(T.year, T.month, T.day, hh.to_i, mm.to_i, ss.to_i)
  end
  difference = times.reduce(&:-)
  puts Time.at(difference.abs).utc.strftime('%H:%M:%S')
end
