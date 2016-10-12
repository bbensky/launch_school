# def repeater(string)
#   characters = string.chars
#   characters.zip(characters).join
# end

# alt one line

# def repeater(string)
#   string.chars.zip(string.chars).join
# end

# alt one line w/ map

# def repeater(string)
#   string.chars.map { |char| char *2 }.join
# end

# alt w/o #join

def repeater(string)
  new_string = ''
  string.chars.map do |char|
    new_string << char * 2
  end
  new_string
end

# alt w/ iterator

# def repeater(string)
#   result = []
#   0.upto(string.size-1) do |index|
#     result << string[index] << string[index]
#   end
#   result.join
# end

# # alt w/ String#each_char

# def repeater(string)
#   result = []
#   string.each_char do |char|
#     result << char << char
#   end
#   result.join
# end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''