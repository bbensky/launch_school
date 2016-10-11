# def swapcase(words)
#   chars = words.split('')
#   chars.map do |char|
#     if char =~ /[a-z]/
#       char.upcase!
#     elsif char =~ /[A-Z]/ 
#       char.downcase!
#     else
#       char
#     end
#   end  
#   p chars.join
# end

# alt more concise

# def swapcase(words)
#   chars = words.split('').map do |char|
#     if char =~ /[a-z]/
#       char.upcase
#     elsif char =~ /[A-Z]/ 
#       char.downcase
#     else
#       char
#     end
#   end  
#   p chars.join
# end

# alt w/ ternary

def swapcase(words)
  chars = words.split('').map do |char|
    char =~ /[A-Z]/ ? char.downcase : char.upcase
  end
  p chars.join
end

# alt w/ case

# def swapcase(words)
#   chars = words.split('')
#   chars.map do |char|
#     case char
#     when /[a-z]/ then char.upcase!
#     when /[A-Z]/ then char.downcase!
#     end  
#   end  
#   p chars.join
# end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

