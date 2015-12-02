module RacingChars
  # Class to hold race car object as it moves across tracks
  class RaceCar
    attr_reader :position

    def initialize(start = nil)
      @position = start
    end

    def update_position(new_position)
      @position = new_position
    end

    # private :update_position
  end

  # Each track portion will get a track object
  class RaceTrack
    def initialize(layout, racecar)
      @track = layout
      @best_route = []
      @car = racecar
    end

    def find_gates_and_checkpoints
      @track.enum_for(:scan, /(_|C)/).map { Regexp.last_match.begin(0) }
    end

    def compare_routes
      options = find_gates_and_checkpoints
      checkpoint, gate = options.partition { |e| @track[e].to_sym == :C }
      position = checkpoint.first || gate.first
      set_best_route(position, @car.position)
    end

    def output_route
      index, character = @best_route
      @track[index] = character
      @track
    end

    def set_best_route(position, current_position)
      current_position ||= position
      turn = case
             when position < current_position then '/'
             when position == current_position then '|'
             when position > current_position then '\\'
             else '|'
             end
      @car.update_position(position)
      @best_route = [position, turn]
    end

    private :set_best_route
  end
end

begin
  car = RacingChars::RaceCar.new
  tracks = []
  ARGF.each_line do |line|
    tracks << RacingChars::RaceTrack.new(line, car)
  end
  tracks.each do |e|
    e.compare_routes
    puts e.output_route
  end
rescue StandardError => e
  puts e
end
