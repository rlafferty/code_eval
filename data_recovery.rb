# Class to decrypt shuffled sentences based on
# an index provided that is missing one value for the
# last word in the array of words
class DataRecovery
  attr_accessor :words, :index, :result

  def initialize(data)
    @words, @index = data.chomp.split(';')
    @words = @words.split(' ')
    @index = @index.split(' ').map(&:to_i)
    @result = []
  end

  def process_data
    find_last_word_index
    decrypt_sentence
    self
  end

  def find_last_word_index
    missing = (1..words.size).to_a - index
    index.push missing.first
    self
  end

  def decrypt_sentence
    self.result = index.zip(words).sort.map(&:last)
  end

  def output_sentence
    result.join(' ')
  end
end

ARGF.each_line do |line|
  text = DataRecovery.new(line)
  puts text.process_data.output_sentence
end
