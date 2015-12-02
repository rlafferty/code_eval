# Container class to compress array sequences
class CompressedSequence
  attr_reader :sequence, :compressed_sequence

  def initialize(nums)
    @sequence = nums
    @compressed_sequence = []
  end

  def compress
    sequence.chunk { |x| x }.map { |e, i| [e, i] }
  end

  def dictate_sequence
    compress.map { |e| [e.last.size, e.first] }.join(' ')
  end
end

ARGF.each_line do |line|
  nums = line.chomp.split(' ')
  seq = CompressedSequence.new(nums)
  puts seq.dictate_sequence
end
