File.open(ARGV[0], "r").each_line do |line|
	nums = line.chomp.split(' ')
	nums.map!(&:to_f)
	nums.sort!
	printf nums.map { '%.3f' }.join(' '), *nums 
	print "\n"
end