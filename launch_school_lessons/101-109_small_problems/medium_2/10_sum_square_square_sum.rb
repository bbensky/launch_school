# def sum_square(number)
#   integers = []
#   1.upto(number) do |num|
#     integers << num
#   end
#   (integers.reduce(:+))**2
# end

# def square_sum(number)
#   integers = []
#   1.upto(number) do |num|
#     integers << (num**2)
#   end
#   integers.reduce(:+)
# end

# def sum_square_difference(number)
#   sum_square(number) - square_sum(number)
# end

# alt shorter

# def sum_square_difference(number)
#   sum = 0
#   sum_of_squares = 0

#   1.upto(number) do |value|
#     sum += value
#     sum_of_squares += value**2
#   end

#   sum**2 - sum_of_squares
# end

# alt calling reduce on Enumerator

def sum_square_difference(number)
  sum = (1.upto(number).reduce(:+))**2
  sum_of_squares = (1.upto(number).reduce(0){ |sum, i| sum += i**2 })
  sum - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150