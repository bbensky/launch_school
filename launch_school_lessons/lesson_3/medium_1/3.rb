puts "the value of 40 + 2 is " + (40 + 2)

# This results in an error because you can't add or concat an integer to a string.

# Solutions:

puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"