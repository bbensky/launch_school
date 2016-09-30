DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  string = ''
  loop do
    integer, value = integer.divmod(10)
    string.prepend(DIGITS[value])
    break if integer.zero?
  end
  string
end

# def signed_integer_to_string(integer)
#   if integer > 0
#     '+'.concat(integer_to_string(integer))
#   elsif integer < 0
#     '-'.concat(integer_to_string(integer*-1))
#   else
#     integer_to_string(integer)
#   end
# end

# def signed_integer_to_string(integer)
#   case integer <=> 0
#   when 0 then integer_to_string(integer)
#   when 1 then '+' + integer_to_string(integer)
#   else        '-' + integer_to_string(-integer)
#   end
# end

# further exploration

# def signed_integer_to_string(number)
#   string = integer_to_string(number.abs)
#   case number <=> 0
#   when +1 then '+' + string
#   when -1 then '-' + string
#   else         string
#   end
# end

def signed_integer_to_string(number)
  ['', '+', '-'][number <=> 0] + integer_to_string(number.abs)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'