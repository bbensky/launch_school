# convert one letter to another based on shift distance
  # Create an array of letters
  # For each letter in the string
    # Find the index of that letter in the array
    # Add the shift distance to determine the new index for that letter 
    # If the new index is greater than 25, subtract 26 from the index
    # return the letter at the new index


class Cipher
  LETTERS = ('a'..'z').to_a

  attr_reader :key

  def initialize(key=nil)
    @key = generate_key(key)
  end

  def encode(input_text)
   transform_text(input_text, :plus)
  end

  def decode(input_text)
    transform_text(input_text, :minus)
  end

  private

  def generate_key(key)
    if key.nil?
      str = ''
      100.times { str << LETTERS.sample }
      str
    elsif valid_key?(key)
      key
    else 
      raise ArgumentError, "Invalid Key"
    end
  end

  def valid_key?(key)
    key.size > 0 && key.chars.all? { |char| ('a'..'z').include?(char)}
  end

  def transform_text(input_text, operation)
    result = ''
    characters = input_text.chars

    characters.each_with_index do |current_letter, idx|
      letter_index = LETTERS.index(current_letter)

      shift_letter = key[idx]
      shift_distance = LETTERS.index(shift_letter)

      new_index = generate_new_index(letter_index, shift_distance, operation)

      result << LETTERS[new_index]
    end

    result
  end

  def generate_new_index(letter_index, shift_distance, operation)
    new_index = nil

    if operation == :plus
      new_index = letter_index + shift_distance
      new_index -= 26 if new_index > 25
    else
      new_index = letter_index - shift_distance
      new_index += 26 if new_index < 0
    end

    new_index
  end
end
