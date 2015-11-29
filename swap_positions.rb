def prep_integers(nums)
  nums.split(' ').map(&:to_i)
end

def prep_swaps(pos)
  sets = pos.split(', ')
  sets.map { |x| x.split('-').map(&:to_i) }
end

def make_swaps(ints, swaps)
  swapped = ints.dup
  swaps.each do |e|
    first, second = e
    swapped[first], swapped[second] = swapped[second], swapped[first]
  end
  swapped
end

ARGF.each_line do |line|
  nums, pos = line.split(' : ').map(&:chomp)
  ints = prep_integers(nums)
  swaps = prep_swaps(pos)
  results = make_swaps(ints, swaps)
  puts results.join(' ')
end
