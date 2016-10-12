CONSONANTS = /[b-df-hj-np-tv-z]/i

# def consonant?(character)
#   (character =~ CONSONANTS) == 0
# end

# def double_consonants(string)
#   result = []
#   string.each_char do |char|
#      consonant?(char) ? result << char * 2 : result << char
#   end
#   p result.join
# end

# alt single method

# def double_consonants(string)
#   result = []
#   string.each_char do |char|
#     (char =~ CONSONANTS) == 0 ? result << char * 2 : result << char
#   end
#   p result.join
# end

# alt only add the character again if it's a consonant

def double_consonants(string)
  result = []
  string.each_char do |char|
    result << char
    result << char if (char =~ CONSONANTS) == 0
  end
  p result.join
end

# alt one line w/ gsub

def double_consonants(string)
  string.gsub(/[b-df-hj-np-tv-z]/i) { |char| char * 2 }
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""