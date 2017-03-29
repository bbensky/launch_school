# input => string
# output => decimal
# invalid input == octal 0

# validate input
  # invalid if any input character is not an integer
  # new value = '0'

require 'pry'

# class Octal
#   def initialize(string)
#     @digits = convert_string(string)
#   end

#   def convert_string(string)
#     valid_input?(string) ? string.split('').map(&:to_i) : [0]
#   end

#   def valid_input?(string)
#     string.chars.none? do |char|
#       char.to_i.to_s != char || [8,9].include?(char.to_i)
#     end
#   end

#   def to_decimal
#     @digits.each_with_index.reduce(0) do |result, (num, idx)|
#       result += num
#       idx < @digits.size - 1 ? result *= 8 : result
#     end
#   end
# end

# alt using exponents

class Octal
  def initialize(string)
    @digits = convert_string(string)
  end

  def to_decimal
    @digits.each_with_index.reduce(0) do |result, (num, idx)|
      result + (num * (8**idx))
    end
  end

  private

  def convert_string(string)
    if valid_input? string
      string.split('')
            .reverse
            .map(&:to_i)
    else
      [0]
    end
  end

  def valid_input?(string)
    string.chars.none? do |char|
      char.to_i.to_s != char || [8,9].include?(char.to_i)
    end
  end
end


