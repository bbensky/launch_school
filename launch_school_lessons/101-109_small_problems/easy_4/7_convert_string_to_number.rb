# def string_to_integer(string)
#   number_hash = { '1' => 1,
#                   '2' => 2,
#                   '3' => 3,
#                   '4' => 4,
#                   '5' => 5,
#                   '6' => 6,
#                   '7' => 7,
#                   '8' => 8,
#                   '9' => 9,
#                   '0' => 0 }
#   number = 0

#   string = string.chars.reverse

#   string.each_with_index do |value, index|
#     number += (number_hash[value] * 10**index)
#   end

#   number              
# end

# alt

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
# }

# def string_to_integer(string)
#   integer = 0
#   string = string.chars.reverse
#   string.each_with_index do |value, index|
#     integer += (DIGITS[value] * 10**index)
#   end
#   integer
# end

# alt

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
# }

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }
  
#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
# }

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }
  
#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

# further exploration

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => '11', 'C' => 12, 'D' => 13, 
  'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(hex)
  hex_array = hex.upcase.chars
  integer = 0
  hex_array.each_with_index do |value, index|
    integer += DIGITS[value]
    integer *= 16 if hex_array[index+1] != nil
  end
  integer
end

p hexadecimal_to_integer('4D9f') == 19871


