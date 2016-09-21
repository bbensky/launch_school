def reverse_words(string)
  split_string = string.split

  split_string.each do |word|
    word.reverse! if word.length >= 5
  end

  split_string.join(' ')
end

def reverse_words_alt(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.length >= 5
    words << word
  end

  words.join(' ')
end

def reverse_words_ternary(string)
  string.split.map do |word|
    word.length >= 5 ? word.reverse! : word
  end.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

puts reverse_words_alt('Professional')          # => lanoisseforP
puts reverse_words_alt('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words_alt('Launch School')         # => hcnuaL loohcS

puts reverse_words_ternary('Professional')          # => lanoisseforP
puts reverse_words_ternary('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words_ternary('Launch School')         # => hcnuaL loohcS