# Class for parsing text to find corresponding digit conversion
class HiddenDigits
  LETTERS = ('a'..'j').to_a
  NUMBERS = (0..9).to_a.map(&:to_s)
  CYPHER = Hash[LETTERS.zip(NUMBERS)].freeze

  def initialize(args)
    @encrypted = args.chomp
    @converted = []
  end

  attr_reader :encrypted, :converted

  def decrypt
    encrypted.each_char { |chr| @converted << lookup(chr) }
    self
  end

  def lookup(char)
    return char if char =~ /\d+/
    CYPHER[char]
  end

  def format_and_compress(default = 'NONE')
    @result = converted.compact.join
    return default if @result.empty?
    @result
  end
end

ARGF.each_line do |line|
  a = HiddenDigits.new(line)
  puts a.decrypt.format_and_compress
end
