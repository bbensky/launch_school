# def sequence(integer)
#   result = []
#   1.upto(integer) { |number| result << number }
#   result
# end

# alt shorter w/ Enumerable#map

# def sequence(integer)
#   1.upto(integer).map { |number| number }
# end

# alt w/ loop

# def sequence(integer)
#   result = []
#   next_number = 1
#   until next_number > integer
#     result << next_number
#     next_number += 1
#   end
#   result
# end

# alt w/ Integer#next

# def sequence(integer)
#   result = []
#   next_number = 1
#   until next_number > integer
#     result << next_number
#     next_number = next_number.next
#   end
#   result
# end

# alt w/ to_a

# def sequence(integer)
#   (1..integer).to_a
# end

# alt w/ inject

def sequence(integer)
  1.upto(integer).inject([]) { |result, number| result << number; result}
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# further exploration

# def sequence(integer)
#   integer.positive? ? (1..integer).to_a : (integer..-1).to_a
# end

# p sequence(-5) == [-5, -4, -3, -2, -1]
# p sequence(-1) == [-1]
