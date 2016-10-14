# def double_number?(number)
#   number_string = number.to_s
#   if number_string.size.even?
#     first_half = number_string[0..(number_string.length / 2 - 1)]
#     second_half = number_string[(number_string.length / 2)..-1]
#     return first_half == second_half
#   end
#   false
# end

# alt shorter

def double_number?(number)
  number.to_s[0, number.to_s.size / 2] == number.to_s[number.to_s.size / 2..-1]
end

#alt w/ String#slice!

# def double_number?(number)
#   number_string = number.to_s
#   if number_string.size.even?
#     first_half = number_string.slice!(0..(number_string.length / 2 - 1))
#     return first_half == number_string
#   end
#   false
# end

def twice(number)
  double_number?(number) ? number : number * 2
end

# alt w/ one method

# def twice(number)
#   string_number = number.to_s
#   center = string_number.size / 2
#   left_side = center.zero? ? '' : string_number[0..center-1]
#   right_side = string_number[center..-1]
#   return number if left_side == right_side
#   number * 2
# end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10