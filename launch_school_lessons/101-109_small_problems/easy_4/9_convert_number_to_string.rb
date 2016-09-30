# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
# }

# def integer_to_string(integer)
#   string = String.new
#   loop do
#     integer, value = integer.divmod(10)
#     string.prepend(DIGITS.key(value))
#     break if integer.zero?
#   end
#   string
# end

# alt

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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Further Exploration

# I found 7 mutating String methods that do not end with !.
# I can't find any that end in ! but don't have a corresponding
# non-mutating method.

# I found 12 mutating Array methods that do not end with !.
# I can't find any that end in ! but don't have a corresponding
# non-mutating method.

# I found 11 mutating Hash methods that do not end with !.
# I can't find any that end in ! but don't have a corresponding
# non-mutating method.