def display_result(operation, number, total)
  puts "The #{operation} of the integers between " \
       "1 and #{number} is #{total}."
end

number = nil

loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.to_i
  break if number > 0
  puts ">> That is not a valid number."
end

operation = ''

loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if operation == 's' || operation == 'p'
  puts ">> That is not a valid option."
end

number_list = (1..(number)).to_a

case operation
when 's'
  total = number_list.reduce(:+)
  display_result('sum', number, total)
else
  total = number_list.reduce(:*)
  display_result('product', number, total)
end

# alt

def compute(number, operation)
  array = (1..number).to_a
  operation == 's' ? array.reduce(:+) : array.reduce(:*)
end

def display_result(operation, number, result)
  operation = operation == 's' ? 'sum' : 'product'
  puts "The #{operation} of the integers between " \
       "1 and #{number} is #{result}."
end

number = nil

loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.to_i
  break if number > 0
  puts ">> That is not a valid number."
end

operation = ''

loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if operation == 's' || operation == 'p'
  puts ">> That is not a valid option."
end

display_result(operation, number, compute(number, operation))