require 'pry'

class RunLengthEncoding
  NUMBERS = ('0'..'9').to_a

  def self.encode(input)
    output = ''
    input_string = input

    until input_string.empty?
      number_of_characters = define_segment(input_string)

      if number_of_characters == 1
        output << input_string[0]
      else
        output << number_of_characters.to_s + input_string[0]
      end

      input_string.slice!(0, number_of_characters)
    end

    output
  end

  def self.define_segment(input_string)
    character = input_string[0]
    character_count = 0

    input_string.each_char do |char|
      char == character ? character_count += 1 : break
    end

    character_count
  end

  def self.decode(input)
    output, number = '', ''
    input_string = input

    until input_string.empty?
      character = input_string.slice!(0, 1)

      if NUMBERS.include? character
        number.concat character
      elsif number == ''
        output.concat character
      else
        number.to_i.times { output.concat character }
        number = ''
      end
    end

    output
  end

  def self.remove_first_character(string)
    string.slice!(0, 1)
  end
end