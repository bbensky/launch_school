# puts 'Enter the length of the room in meters:'
# length = gets.chomp.to_f
# puts 'Enter the width of the room in meters:'
# width = gets.chomp.to_f

# area_in_meters = (length * width).round(2)
# area_in_feet = (area_in_meters * 10.7639).round(2)
# puts "The area of the room is #{area_in_meters} square meters (#{area_in_feet} square feet)."

# alt w/ constant

# SQMETERS_TO_SQFEET = 10.7639

# puts 'Enter the length of the room in meters:'
# length = gets.to_f
# puts 'Enter the width of the room in meters:'
# width = gets.to_f

# square_meters = (length * width).round(2)
# square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

# puts "The area of the room is #{square_meters} " + \
#      "square meters (#{square_feet} square feet)."

# alt - sq feet, inches, centimeters

SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

puts 'Enter the length of the room in feet:'
length = gets.to_f
puts 'Enter the width of the room in feet:'
width = gets.to_f

square_feet = (length * width).round(2)
square_inches = (square_feet * SQFEET_TO_SQINCHES).round(2)
square_centimeters = square_inches * SQINCHES_TO_SQCENTIMETERS

puts "The area of the room is #{square_feet} " + \
     "square feet (#{square_inches} inches, " + \
     "#{square_centimeters} centimeters)."

