# normalize text
  # remove characters that are not letters
  # downcase letters

require 'pry'

class Crypto
  VALID_CHARACTERS = ('a'..'z').to_a + ('0'..'9').to_a

  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @normalized_text = @text.chars.map do |char| 
      VALID_CHARACTERS.include?(char.downcase) ? char.downcase : ''
    end.join
  end

  def size
    text_size = normalize_plaintext.size
    Math.sqrt(text_size).ceil
  end

  def plaintext_segments
    result = []
    text = normalize_plaintext
    break_index = size 

    until text.size == 0
      result << text.slice!(0, break_index)
    end

    result
  end

  def ciphertext
    cipherize(:string)
  end

  def normalize_ciphertext
    cipherize(:array)
  end

  private

  def cipherize(data_structure)
    result = data_structure == :array ? [] : '' 
    columns = plaintext_segments.first.length

    columns.times do |column|
      text_group = ''

      plaintext_segments.each do |word| 
        text_group << word[column] unless word[column].nil?
      end

      result << text_group
    end

    result.class == Array ? result.join(' ') : result
  end
end