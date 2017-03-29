# string of letters, spaces, point at the end
# words have 1-20 characters
# words spearated by one or more spaces
# terminated by 0+ spaces with a period at the end
# output text is each word separated by a space and a point at the end
# if a word is even, keep it as is
# if a word is odd, reverse the word

# bonus - read and print characters one at a time

# happy input: "whats the matter with kansas.", "whats the matter with kansas  ."
# failure: "12 how are you", ".", "how are you" "thisisaverylongwordlongword."
  # is there a period at the end?
  # are all characters numbers or spaces except for the last character?
  # is any word longer than 20 characters?
# edge: "hello." "twentycharacterslong ."

# abstractions
  # word size - too big? odd or even?
  # reverse a word


# Input word
  # Validate characters and period
  # Validate word size
    # split words
    # Error if any word length > 20?
      # Treat the last word differently (length up to last character > 20?)

  # Push each word in the collection to a result string, with a space
    # If odd, reverse letters
    # If the last character of the last word is a period, take that into account
    # If the last word is a period, replace the last character of the result string with the period

VALID_CHARACTERS = ('a'..'z').to_a + ('A'..'Z').to_a + [' ']

def ending_period?(text)
  text[-1] == '.'
end

def valid_characters?(text)
  text[0..-2].chars.all? { |char| VALID_CHARACTERS.include?(char) } 
end

def valid_word_length?(text)
  text.split.all? do |word|
    if word[-1] == '.'
      word.size <= 21
    else
      word.size <= 20
    end
  end
end

def valid_text?(text)
  ending_period?(text) && valid_characters?(text) && valid_word_length?(text)
end

def odd_words(text)
  return "Invalid Text" unless valid_text?(text)

  words = text[0..-2].split

  words.map.with_index do |word, idx|
    idx.odd? ? word.split('').reverse.join : word
  end.join(' ') + '.'
end

# Failure Cases
# p odd_words("12 how are you")
# p odd_words("how are you")
# p odd_words("thisisaverylongwordlongword.")
# p odd_words("")

# Happy Cases
p odd_words("whats the matter with kansas .")
p odd_words("whats the matter with kansas  .")

# Edge Cases
p odd_words("hello.")
p odd_words("helloo there.")
p odd_words("twentycharacterslong .")
p odd_words("whats  the     matter with   kansas  .")