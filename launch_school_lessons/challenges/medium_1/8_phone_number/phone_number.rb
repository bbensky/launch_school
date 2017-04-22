class PhoneNumber
  MIN_SIZE = 10
  MAX_SIZE = 11
  NUMBERS = (0..9).to_a.map(&:to_s)
  VALID_CHARACTERS = NUMBERS + ['(', ')', '-', ' ', '.']

  def initialize(number_input)
    @number_input = number_input
  end

  def number
    return invalid_string_output if !valid_characters

    digits = @number_input.chars.select { |char| NUMBERS.include?(char)}.join
    
    if valid_length?(digits)
      digits[-10..-1]
    else 
      invalid_string_output
    end
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end

  private

  def valid_characters
    @number_input.chars.all? { |char| VALID_CHARACTERS.include?(char) }
  end

  def valid_length?(digits)
    digits.length == MIN_SIZE || valid_max_digits?(digits)
  end

  def valid_max_digits?(digits)
    digits.length == MAX_SIZE && digits[0] == '1'
  end

  def invalid_string_output
    '0000000000'
  end
end

PhoneNumber.new('(123) 456-7890').number