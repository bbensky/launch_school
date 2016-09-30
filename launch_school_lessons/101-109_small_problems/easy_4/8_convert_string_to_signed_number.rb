DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# def string_to_signed_integer(string)
#   negative = true if string[0] == '-'
#   string = string.delete("^0-9") 
#   integer = string_to_integer(string)
#   negative ? 0 - integer : integer
# end

# alt

# def string_to_signed_integer(string)
#   case string[0]
#   when '+' then string_to_integer(string[1..-1])
#   when '-' then -string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

#further exploration

# def string_to_signed_integer(string)
#   if %w(+ -).include?(string[0])
#     value = string_to_integer(string[1..-1])
#     string[0] == '-' ? -value : value
#   else
#     string_to_integer(string)
#   end
# end

# alt

def string_to_signed_integer(string)
  integer = string_to_integer(string.delete('+-'))
  string[0] == '-' ? -integer : integer
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100