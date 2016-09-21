def is_odd?(number)
  return false if number != number.to_i
  number % 2 != 0
end

# alt

def is_odd?(number)
  number % 2 == 1
end


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(7.1)  # => false
puts is_odd?(-5.0) # => true