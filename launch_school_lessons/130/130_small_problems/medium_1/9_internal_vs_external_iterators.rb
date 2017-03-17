# factorial = Enumerator.new do |yielder|
#   a = 0
  
#   loop do
#     if a == 0
#       yielder << 1
#     else
#       yielder << (1..a).inject(:*)
#     end
#     a += 1
#   end
# end

# alt

# factorial = Enumerator.new do |yielder|
#   yielder << 1
#   number_array = [1]

#   loop do
#     yielder << number_array.inject(:*)
#     number_array << number_array[-1] + 1
#   end
# end

# alt LS solution

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    accumulator += 1
  end
end

7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |n, idx|
  puts n
  break if idx == 6
end