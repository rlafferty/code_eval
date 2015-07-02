def find_multiple(a, b)
	multiple = 1
	loop do
		return multiple * b if multiple * b >= a
		multiple += 1
	end
end

File.foreach(ARGV[0]) do |line|
 nums = line.split(',')
 nums.map!(&:to_i)
 puts find_multiple(nums[0], nums[1])
end