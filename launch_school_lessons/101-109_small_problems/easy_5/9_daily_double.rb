# def crunch(string)
#   index = 0
#   until index == string.length
#     while string[index] == string[index+1] 
#       string[index+1] = ''
#     end
#     index += 1
#   end
#   string
# end

# alt - only pushes characters if it's not equal to the next character

# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length - 1
#     crunch_text << text[index] unless text[index] == text[index+1]
#     index += 1
#   end
#   crunch_text
# end

# alt w/squeeze

# def crunch(text)
#   text.squeeze
# end

# alt w/ only pushing characters if the character is not equal to the last character
# in the new string

# def crunch(text)
#   result = ''
#   text.each_char { |char| result << char if char != result[-1] }
#   result
# end

# alt w/ regex

def crunch(text)
  text.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# futher exploration

# If iteration stops when index is equal to text.length - 1, the 
# loop won't evaluate the last character of the string.

