# def reversed_number(integer)
#   integer.to_s.reverse.to_i
# end

# # alt w/ divmod

# def reversed_number(integer)
#   result = []
#   until integer.zero?
#     integer, remainder = integer.divmod(10)
#     result.push(remainder)
#   end 
#   p result.join.to_i
# end

# alt w/ inject

def reversed_number(integer)
  result = []
  until integer.zero?
    integer, remainder = integer.divmod(10)
    result.push(remainder)
  end 
  p result.inject { |number, digit| number * 10 + digit }
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1