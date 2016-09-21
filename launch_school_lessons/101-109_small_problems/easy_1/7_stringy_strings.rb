def stringy(number)
  alternating_string = ''

  number.times do
    if alternating_string.length.even?
      alternating_string << '1' 
    else
      alternating_string << '0'
    end
  end

  alternating_string
end

def stringy_divmod(number)
  alternating_string = ''

  ones_and_zeros, one = number.divmod(2)
  ones_and_zeros.times { alternating_string << '10' }
  one.times { alternating_string << '1' }

  alternating_string
end

def stringy_ternary(size)
  numbers = []

  size.times do |number|
    number.even? ? numbers << '1' : numbers << '0'
  end

  numbers.join
end

def stringy_second_arg(size, optional=1)
  numbers = []

  if optional == 1
    size.times do |number|
      number.even? ? numbers << '1' : numbers << '0'
    end
  else
    size.times do |number|
      number.even? ? numbers << '0' : numbers << '1'
    end
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy_divmod(6) == '101010'
puts stringy_divmod(9) == '101010101'
puts stringy_divmod(4) == '1010'
puts stringy_divmod(7) == '1010101'

puts stringy_ternary(6) == '101010'
puts stringy_ternary(9) == '101010101'
puts stringy_ternary(4) == '1010'
puts stringy_ternary(7) == '1010101'

puts stringy_second_arg(6) == '101010'
puts stringy_second_arg(6, 0) == '010101'
