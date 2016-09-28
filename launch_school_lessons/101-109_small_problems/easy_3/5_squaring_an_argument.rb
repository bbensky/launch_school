def multiply(n1, n2)
  n1 * n2
end

# def square(n)
#   multiply(n, n)
# end

# p square(5) == 25
# p square(-8) == 64

# further exploration:

def power_to_the_n(number, power)
  return 1 if power == 0
  total = number

    (power-1).times do 
      total = multiply(total, number)
    end

  total
end

#alt

def power_to_the_n(number, power)
  result = 1
    power.times do 
      result = multiply(result, number)
    end
  result
end

p power_to_the_n(5, 3)