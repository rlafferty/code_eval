def play_fizz_buzz(counter, fizz, buzz)
	game_arr = []
	(1..counter).each do |x|
		val = ''
		val += 'F' if x % fizz == 0
		val += 'B' if x % buzz == 0
		val = x if val.empty?
		game_arr << val
	end
	game_arr
end

File.foreach(ARGV[0]) do |line|
	arr = line.split(' ')
	counter = arr.pop.to_i
	buzz = arr.pop.to_i
	fizz = arr.pop.to_i
	result = play_fizz_buzz(counter, fizz, buzz)
	puts result.map(&:to_s).join(' ')
end