# def show_multiplicative_average(numbers)
#   result = (numbers.inject(:*) / numbers.size.to_f)
#   puts 'The result is ' + format('%.3f', result)
# end 

# alt one line

def show_multiplicative_average(numbers)
  puts "The result is #{sprintf('%.3f', numbers.inject(:*).to_f / numbers.size)}"
end 

# alt w/o #inject

# def show_multiplicative_average(numbers)
#   product = 1
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts 'The result is ' + format('%.3f', average)
# end 

show_multiplicative_average([3, 5])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

# further exploration

# Omitting the call to #to_f on the first line of the method
# will result in the average operation returning a value rounded down
# to the nearest integer.