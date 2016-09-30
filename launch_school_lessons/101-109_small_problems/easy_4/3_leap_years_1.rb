# def leap_year?(year)
#   if year % 100 == 0
#     return true if year % 400 == 0
#   else 
#     return true if year % 4 == 0
#   end
#   false
# end

# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end

# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0) 
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

# further exploration:

# def leap_year?(year)
#   if year % 100 == 0
#     false
#   elsif year % 400 == 0
#     true
#   else
#     year % 4 == 0
#   end
# end

# All years divisible by 100 will fail the test, including years divisible by 400.

# def leap_year?(year)
#   if (year % 4).zero?
#     if (year % 100).zero?
#       if (year % 400).zero?
#         true
#       else
#         false
#       end
#     else
#       true
#     end
#   else
#     false
#   end
# end

# This is a more complex solution than the first three solutions.

def leap_year?(year)
  return false unless year % 4 == 0
  return true unless year % 100 == 0
  return false unless year % 400 == 0 
  true
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
