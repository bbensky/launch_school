def average(array)
  total = 0
  array.each { |number| total += number }
  total / array.size
end

def average_reduce(array)
  total = array.reduce(:+)
  total / array.count
end

def average_short(numbers)
  numbers.reduce(:+) / numbers.count
end

def average_float(numbers)
  sum = numbers.reduce { |sum, number| sum + number} 
  sum.to_f/numbers.count
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average_reduce([1, 5, 87, 45, 8, 8]) == 25
puts average_reduce([9, 47, 23, 95, 16, 52]) == 40

puts average_short([1, 5, 87, 45, 8, 8]) == 25
puts average_short([9, 47, 23, 95, 16, 52]) == 40

puts average_float([1, 5, 87, 45, 8, 8]) == 25
puts average_float([9, 47, 23, 95, 16, 52]) == 40