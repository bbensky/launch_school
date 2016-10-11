# def penultimate(text)
#   p text.split[-2]
# end

# alt slightly longer

# def penultimate(text)
#   words = text.split
#   words[words.size-2]
# end

# alt w/ Array#pop

def penultimate(text)
  words = text.split
  words.pop
  words.pop
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# further exploration

# Write a method that returns the middle word of a phrase or sentence. 
# It should handle all of the edge cases you thought of.

# Edge Cases:
# 1) Strings containing two or less words
# 2) Strings containing four or more words with an even number of words.

# def middle_word(text)
#   words = text.split
#   word_count = words.size
#   return "no middle word" if word_count < 3 || (word_count >= 4 && word_count.even?)
#   words[word_count / 2]
# end

# p middle_word('')
# p middle_word('alpha')
# p middle_word('alpha beta')
# p middle_word('alpha beta gamma')
# p middle_word('alpha beta gamma delta')
# p middle_word('alpha beta gamma delta epsilon')