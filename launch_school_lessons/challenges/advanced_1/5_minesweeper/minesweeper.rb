# input is an array of strings
# output is an array strings

# Instantiate an output array
# Iterate through the input array
# For each array element (line of the game)
  # Create a new string that will be pushed to the output array
  # Iterate through the characters in each string
    # If a character is not a space, push it to the output string
    # Else start a counter 

require 'pry'

class ValueError < ArgumentError; end

class Board
  VALID_CHARACTERS = [:+, :-, :|, :*, :' ']

  def self.transform(inp)
    @@input  = inp
    @@output = []
    raise ValueError unless valid_input?

    @@input.each.with_index do |line, line_idx|
      if [0, (@@input.size - 1)].include?(line_idx)
        @@output << line
        next
      end

      output_line = ''

      line.each_char.with_index do |char, char_idx|
        if char == ' '       
          star_count = calculate_stars(line_idx, char_idx)
          if star_count.zero?
            output_line << ' '
          else
            output_line << star_count.to_s
          end
        else
          output_line << char
        end
      end

      @@output << output_line
    end

    @@output
  end

  def self.calculate_stars(line_idx, char_idx)
    line_range  = (line_idx-1..line_idx+1)
    index_range = (char_idx-1..char_idx+1)
    star_count  = 0

    @@input[line_range].each do |line|
      line[index_range].each_char do |char|
        star_count += 1 if char == '*'
      end
    end

    star_count
  end

  def self.valid_input?
    valid_line_size? && valid_first_last_lines? && valid_characters?
  end

  def self.valid_line_size?
    @@input.all? { |line| line.size == @@input.first.size }
  end

  def self.valid_first_last_lines?
    valid_line = '+' + ('-'*(@@input.first.size-2)) + '+'

    [@@input.first, @@input.last].all? { |line| line == valid_line }
  end

  def self.valid_characters?
    @@input.all? do |line|
      line.chars.all? { |char| VALID_CHARACTERS.include?(char.to_sym) }
    end
  end
end

inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
       '| *  * |', '|      |', '+------+']

p  Board.transform(inp)