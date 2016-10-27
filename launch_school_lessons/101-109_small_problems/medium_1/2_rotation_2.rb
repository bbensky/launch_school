def rotate_array(array)
  array[1..-1] + [array[0]]
end

# def rotate_rightmost_digits(number, digit)
#   digits = number.to_s.chars

#   first_group = digits[0..(-digit - 1)]
#   second_group = digits[-digit..-1]

#   if first_group == second_group
#     p first_group.join.to_i
#   else
#     p (first_group + rotate_array(second_group)).join.to_i
#   end

# end

# alt more clear?

# def rotate_rightmost_digits(number, breakpoint)
#   result = []
#   digits = number.to_s.chars
#   breakpoint = -breakpoint

#   first_group = digits[0..(breakpoint - 1)]
#   second_group = digits[breakpoint..-1]

#   if first_group == second_group
#     result = first_group
#   else
#     result = first_group + rotate_array(second_group)
#   end

# alt shorter

def rotate_rightmost_digits(number, breakpoint)
  digits = number.to_s.chars
  digits[-breakpoint..-1] = rotate_array(digits[-breakpoint..-1]) if !breakpoint.zero?
  digits.join.to_i
end

# alt only altering second group

# def rotate_rightmost_digits(number, breakpoint)
#   digits = number.to_s.chars
#   digits[-breakpoint..-1] = rotate_array(digits[-breakpoint..-1])
#   digits.join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
#   p all_digits.join.to_i
# end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
p rotate_rightmost_digits(735291, 0) == 735291