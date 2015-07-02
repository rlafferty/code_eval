File.foreach(ARGV[0]) do |line|
	puts line.split(' ').reverse.join(' ') unless line.chomp.empty?
end