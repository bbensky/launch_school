# print "Please write word or multiple words: "
# words = gets.chomp

# total_letters = 0

# words.split.each do |word|
#   total_letters += word.size
# end

# puts "There are #{total_letters} characters in #{words.inspect}."

# alt 

# print "Please write word or multiple words: "
# words = gets.chomp

# total_letters = words.delete(' ').size

# puts "There are #{total_letters} characters in #{words.inspect}."

#alt

# print "Please write word or multiple words: "
# words = gets.chomp

# total_letters = words.length - words.chars.count(" ")

# puts "There are #{total_letters} characters in #{words.inspect}."

#alt

print "Please write word or multiple words: "
words = gets.chomp

total_letters = words.split.join.length

puts "There are #{total_letters} characters in #{words.inspect}."