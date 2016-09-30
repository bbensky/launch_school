# def multisum(number)
#   multiples = []
#   1.upto(number).each do |num|
#     if num % 3 == 0 || num % 5 == 0
#       multiples << num
#     end
#   end
#   multiples.reduce(:+)
# end

# def multiple?(number, divisor)
#   (number % divisor).zero?
# end

# def multisum(max_value)
#   sum = 0
#   1.upto(max_value) do |number|
#     if multiple?(number, 3) || multiple?(number, 5)
#       sum += number
#     end
#   end
#   sum
# end

def multisum(number)
  (1..number).select { |value| value % 3 == 0 || value % 5 == 0}.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168