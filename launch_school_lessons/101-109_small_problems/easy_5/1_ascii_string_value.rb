# def ascii_value(string)
#   total = 0
#   string.each_char { |char| total += char.ord }
#   total
# end

# alt

def ascii_value(string)
  string.chars.reduce(0) { |sum, char| sum += char.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration

# char.ord.mystery == char

# The mystery method is Integer#chr

# def ascii_value(string)
#   string.each_char { |char| puts char.ord.chr == char }
# end

# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# If you try this with a longer string, it will just return 
# the first letter of the string.
