# Pig Latin is a made-up children's language that's intended to be confusing.
# It obeys a few simple rules (below), but when it's spoken quickly it's really
# difficult for non-children (and non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of 
#         the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the 
#         word, and then add an "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants too.

# Edge cases:
  # 1) If a word begins with multiple consonants before a vowel, move all the 
  #    consonants to the end of the word.
  # 2) If the first two letters are 'qu', move both to the end.
  # 2a) If the 2nd and 3rd letters are 'qu', and first letter is a consonant,
  #     move all three letters to the end
  # 3) If the first letter is 'x' or 'y', and the 2nd letter is a vowel, treat 
  #    like a consonant.
  # 3a) If the first letter is 'x' or 'y', and the 2nd letter is a consonant, 
  #     treat like a vowel.

  require 'pry'

  class PigLatin
    VOWELS = %w(a e i o u)
    SUFFIX = 'ay'

    def self.translate(text)
      words = text.split

      words.map! do |word|
        if VOWELS.include?(word[0])
          self.no_switch(word)

        elsif ['x', 'y'].include?word[0]
          if VOWELS.include?(word[1])
            self.letter_switch(word, 1)
          else
            self.no_switch(word)
          end

        elsif word[0..2].include?('qu')
          if word[0, 2] == 'qu'
            self.letter_switch(word, 2)
          else
            self.letter_switch(word, 3)
          end
          
        else
          first_vowel_index = word.index(/[aeiou]/)
          self.letter_switch(word, first_vowel_index)
        end
      end

      words.join(' ')
    end

    private

    def self.no_switch(text)
      text << SUFFIX
    end

    def self.letter_switch(word, idx)
      switched_letters = word.slice!(0...idx)
      word << switched_letters << SUFFIX 
    end
  end

  p PigLatin.translate('quick fast run')
