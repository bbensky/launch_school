# def sequence(count, integer)
#   result = []

#   1.upto(count) do |multiplier|
#     result << integer * multiplier
#   end

#   result
# end

# alt w/ map

# def sequence(count, integer)
#   1.upto(count).map { |multiplier| integer * multiplier }
# end

# alt w/ inject

# def sequence(count, integer)
#   1.upto(count).inject([]) { |result, multiplier| result << integer * multiplier }
# end

# alt w/ range

# def sequence(count, first)
#   (1..count).map { |index| first * index}
# end

# alt w/o multiplying

def sequence(count, first)
  sum = 0
  result = []
  count.times do
    result << sum += first
  end
  result
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []