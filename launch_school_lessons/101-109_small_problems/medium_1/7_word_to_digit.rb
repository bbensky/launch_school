# DIGIT_WORDS = { 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
#                 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8,
#                 'nine' => 9, 'zero' => 0 }

# def word_to_digit(text)
#   words = text.split
#   words.map! do |word|
#     if DIGIT_WORDS.keys.include?(word)
#       DIGIT_WORDS[word] 
#     elsif DIGIT_WORDS.keys.include?(word[0..-2])
#       DIGIT_WORDS[word[0..-2]].to_s + word[-1]
#     else
#       word
#     end
#   end
#   p words.join(' ')
# end

# alt w/ regex

DIGIT_WORDS = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
                'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8',
                'nine' => '9', 'zero' => '0' }

# def word_to_digit(text)
#   DIGIT_WORDS.keys.each do |word|
#     text.gsub!(/\b#{word}\b/, DIGIT_WORDS[word])
#   end
#   text
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# further exploration

def word_to_digit(text)
  DIGIT_WORDS.keys.each do |word|
    text.gsub!(/\b#{word}\b/, DIGIT_WORDS[word] + ' ')
  end
  text.gsub!(/\s\s/, '')
  text.gsub!(/\s[.]/, '.')
  text.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3')
  text
end

p word_to_digit('Please call me at four four six five five five one two three four. Thanks.')
