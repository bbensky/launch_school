# def fibonacci(nth)
#   first = 1
#   second = 1

#   (nth-2).times do
#     temp = second
#     second = first + second
#     first = temp
#   end

#   second
# end

# alt w/ array

# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end
#   p last
# end

# alt w/ array for fib numbers

def fibonacci(num, arr = [1, 1])
  return 1 if num == 1 || num == 2
  loop do
    arr << arr[-1] + arr[-2]
    break if arr.size >= num
  end
  arr[-1]
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501