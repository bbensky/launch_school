# def fizzbuzz(num1, num2)
#   result = []
#   num1.upto(num2) do |number|
#     if number % 3 == 0 && number % 5 == 0
#       result << 'FizzBuzz'
#     elsif number % 3 == 0
#       result << 'Fizz'
#     elsif number % 5 == 0
#       result << 'Buzz, '
#     else
#       result << number
#     end
#   end
#   puts result.join(', ')
# end

# alt w/ 2 methods

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case 
  when (number % 3).zero? && (number % 5).zero?
    'FizzBuzz'
  when (number % 3).zero?
    'Fizz'
  when (number % 5).zero?
    'Buzz'
  else
    number
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz