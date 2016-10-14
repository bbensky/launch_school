# def negative(number)
#   number <= 0 ? number : -number
# end

#alt opposite

# def negative(number)
#   number > 0 ? -number : number
# end

# alt w/ abs

def negative(number)
  -number.abs
end

# further exploration

# The solution with Numberic#abs is shorter,
# but might not be superior to the ternary solution
# as it's not as clear of an explanation.

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0   