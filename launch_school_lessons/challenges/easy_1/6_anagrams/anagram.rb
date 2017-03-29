# input: array of strings
# output: array of strings

# Class setup
  # initialize w/ string => assign to instance variable
  # match method takes in array of strings
  # specify sort method?

# anagram logic
  # sort each word's characters alphabetically
  # compare whether the two words sorted characters are equal
    # if true, push the word to a result array

class Anagram
  def initialize(word)
    @word = word
    @sorted_letters = sorted_letters(word)
  end

  def match(match_words)
    match_words.select do |match_word|
      match_word.downcase != @word.downcase &&
      sorted_letters(match_word) == @sorted_letters
    end
  end

  private

  def sorted_letters(word)
    word.downcase.chars.sort
  end
end

detector = Anagram.new('master')
p detector.match(%w(stream pigeon maters)).sort
