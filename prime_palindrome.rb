require 'prime'

puts Prime.each(1000).select { |x| x.to_s == x.to_s.reverse }.max