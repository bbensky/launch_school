require 'pry'
# Input: should be a string, maybe not
  # input can be lowercase or uppercase
  # non-letters can be entered, but won't affect the score

# Set score to 0

# Data sctructure for letter values: hash of array/integer
  # iterate through keys
  # if letter is in key, add value to score

class Scrabble
  LETTERS = ('A'..'Z').to_a
  LETTER_VALUES = { %w(A E I O U L N R S T) => 1,
                    %w(D G)                 => 2,
                    %w(B C M P)             => 3,
                    %w(F H V W Y)           => 4,
                    %w(K)                   => 5, 
                    %w(J X)                 => 8,
                    %w(Q Z)                 => 10 }

  attr_reader :string

  def self.score(string)
    Scrabble.new(string).score
  end
 
  def initialize(string)
    @string = string.to_s
  end

  def calculate_letter_score(char)
    LETTER_VALUES.each do |letters, value|
      return value if letters.include?(char)
    end
  end

  # def score
  #   result = 0

  #     string.each_char do |char|
  #       if LETTERS.include?(char.upcase)
  #         result += calculate_letter_score(char.upcase)
  #       end
  #     end

  #   result
  # end

  # alt w/ sum

  def score
      string.upcase.chars.sum do |char| 
        LETTERS.include?(char) ? calculate_letter_score(char) : 0
      end
  end
end

p Scrabble.new('OXYPHENBUTAZONE').score