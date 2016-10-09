# def find_fibonacci_index_by_length(digits)
#   series = [1, 1]
#   loop do
#     series << series[-2] + series[-1]
#     break if series[-1].to_s.length == digits
#   end
#   p series.index(series[-1]) + 1
# end

# alt - more clear?

# def find_fibonacci_index_by_length(digits)
#   fib_series = [1, 1]
#   loop do
#     next_number = fib_series[-2] + fib_series[-1]
#     fib_series << next_number
#     break if fib_series.last.to_s.length == digits
#   end
#   fib_series.index(fib_series.last) + 1
# end

# alt no array

def find_fibonacci_index_by_length(digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    number = first + second
    break if number.to_s.length >= digits

    first = second
    second = number
  end

  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847