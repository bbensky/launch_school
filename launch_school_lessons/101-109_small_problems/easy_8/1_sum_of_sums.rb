# def sum_of_sums(numbers)
#   numbers_to_add = Array.new
#   numbers.size.times do |index|
#     numbers_to_add += numbers[0..index]
#   end
#   numbers_to_add.reduce(:+)
# end

# alt w/ #each_index

def sum_of_sums(numbers)
  numbers_to_add = Array.new
  numbers.each_index do |index|
    numbers_to_add += numbers[0..index]
  end
  numbers_to_add.reduce(:+)
end

# alt w/ #upto

# def sum_of_sums(numbers)
#   sum_total = 0
#   1.upto(numbers.size) do |count|
#     sum_total += numbers.slice(0, count).inject(:+)
#   end
#   sum_total
# end

# alt w/ #pop

# def sum_of_sums(numbers)
#   sum_total = 0
#   until numbers.empty?
#     sum_total += numbers.reduce(:+)
#     numbers.pop
#   end
#   sum_total
# end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35