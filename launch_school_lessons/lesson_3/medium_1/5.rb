def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1

# Number % dividend == 0 is used to determine whether dividing the number by the dividend
# will result is a whole number.

# Bonus 2

# Because it's the last line in the method, the contents of the divisors array will be what's
# returned from calling the method. 
