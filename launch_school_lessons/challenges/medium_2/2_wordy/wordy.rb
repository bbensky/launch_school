# Input string
# Output integer

# Valid input:
  # First 8 characters are 'What is '
  # 9th character is an integer or - sign

# Hash to convert strings to operations

require 'pry'

class WordProblem
  VALID_STRINGS = ['What', 'is', '-', 'plus', 'minus', 'multiplied',
                   'divided', 'by']

  OPERATIONS = { 'plus' => :+, 'minus' => :-, 'multiplied' => :*,
                 'divided' => :/ }

  def initialize words
    @words = words
  end

  def answer
    raise ArgumentError unless valid_question?
    clean

    result = @working_array.first

    @working_array.each_with_index do |item, idx|
      if idx.odd?
        result = result.send item, @working_array[idx+1]
      end
    end

    result
  end

  private

  def valid_question?
    return false if @words[-1] != '?'

    words = @words[0..-2].split
    words.all? { |word| VALID_STRINGS.include?(word) || integer?(word) } 
  end

  def integer?(word)
    word.to_i.to_s == word
  end

  def clean
    words = @words[8..-2]
    @working_array = words.split.select { |word| word != 'by' }
      .map.with_index do |word, idx|
        idx.even? ? word.to_i : OPERATIONS[word]
    end
  end
end 