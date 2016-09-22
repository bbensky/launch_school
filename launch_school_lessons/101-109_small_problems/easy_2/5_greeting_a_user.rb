# print 'What is your name? '
# name = gets.chomp

# if name.end_with?('!')
#   puts "HELLO #{name.delete('!').upcase}. " \
#        "WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# alt with match

# print 'What is your name? '
# name = gets.chomp

# if name.match('!') != nil
#   puts "HELLO #{name.delete('!').upcase}. " \
#        "WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# alt with index and chomp

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. " \
       "WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end