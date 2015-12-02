# Class created in order to handle data for road trips
class RoadTrip
  attr_reader :list

  def initialize(args)
    @list = args
    @stops = []
    separate_stops(list)
  end

  def separate_stops(stop_list)
    @stops = stop_list.reject { |e| e =~ /[^\d+]/ }.map(&:to_i).sort
  end

  def calculate_distance
    results = []
    ([0] + @stops).each_cons(2) do |e|
      results << e.last - e.first
    end
    results
  end
end

ARGF.each_line do |line|
  data = line.chomp.split(/[,;]/)
  trip = RoadTrip.new(data)
  puts trip.calculate_distance.join(',')
end
