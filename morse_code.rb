MORSE_LOOKUP = {:'.-' => 'A',
                :'-...' => 'B',
                :'-.-.' => 'C',
                :'-..' => 'D',
                :'.' => 'E',
                :'..-.' => 'F',
                :'--.' => 'G',
                :'....' => 'H',
                :'..' => 'I',
                :'.---' => 'J',
                :'-.-' => 'K',
                :'.-..' => 'L',
                :'--' => 'M',
                :'-.' => 'N',
                :'---' => 'O',
                :'.--.' => 'P',
                :'--.-' => 'Q',
                :'.-.' => 'R',
                :'...' => 'S',
                :'-' => 'T',
                :'..-' => 'U',
                :'...-' => 'V',
                :'.--' => 'W',
                :'-..-' => 'X',
                :'-.--' => 'Y',
                :'--..' => 'Z',
                :'-----' => 0,
                :'.----' => 1,
                :'..---' => 2,
                :'...--' => 3,
                :'....-' => 4,
                :'.....' => 5,
                :'-....' => 6,
                :'--...' => 7,
                :'---..' => 8,
                :'----.' => 9}

class MorseCode
  attr_reader :encoded, :converted

  def initialize(code)
    @encoded = code
  end

  def convert_text
    @converted = parse_words
  end
  
  def parse_words
    encoded.split('  ').map { |x| x.split(' ')}
  end
  
  def decode_words
    self.converted.map do |arr|
      arr.map { |e| lookup(e) }.join()
    end.join(' ')
  end

  def lookup(element)
    ::MORSE_LOOKUP.fetch(element.to_sym)
  end
end

ARGF.each_line do |line|
  morse_text = line.chomp
  a = MorseCode.new(morse_text)
  a.convert_text
  puts a.decode_words
end
