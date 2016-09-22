puts "Teddy is #{rand(20..200)} years old!"

#bonus

puts "Please enter a name."
input_name = gets.chomp
display_name = input_name != '' ? input_name : 'Teddy'
age = rand(20..200)
puts "#{display_name} is #{age} years old!"

#bonus alt

puts "Please enter a name."
name = gets.chomp
name = 'Teddy' if name == ''
age = rand(20..200)
puts "#{name} is #{age} years old!"
