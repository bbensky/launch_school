# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# def rotate_rightmost_digits(number, breakpoint)
#   digits = number.to_s.chars
#   digits[-breakpoint..-1] = rotate_array(digits[-breakpoint..-1]) if !breakpoint.zero?
#   digits.join.to_i
# end

# def max_rotation(number)
#   breakpoint = number.to_s.length
#   while breakpoint >= 2
#     number = rotate_rightmost_digits(number, breakpoint)
#     breakpoint -= 1
#   end
#   number
# end

# alt w/ Integer#downto

# def max_rotation(number)
#   num_length = number.to_s.length
#   num_length.downto(2) do |breakpoint|
#     number = rotate_rightmost_digits(number, breakpoint)
#   end
#   number
# end

# futher exploration

# def max_rotation(number)
#   num_arr= number.to_s.chars

#   rotations = num_arr.length - 1

#   starting_digit = 0

#   rotations.downto(1) do
#     frozen_digits = num_arr[0, starting_digit]
#     working_digits = num_arr[starting_digit..-1]
#     working_digits.push(working_digits.shift)
#     num_arr = frozen_digits + working_digits
#     starting_digit += 1
#   end

#   num_arr.join.to_i

# end

# alt Nick Geballe solution

def max_rotation(num)
  num_str = num.to_s
  num_str.size.times do |index|
    num_str[index..-1] = num_str[index+1..-1] + num_str[index]
  end
  num_str.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
