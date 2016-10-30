# def featured(number)
#   return "There is no possible number that fulfills those requirements." if number > 9_876_543_210

#   loop do
#     number += 1
#     digits = number.to_s.chars

#     if number.odd? &&
#        (number % 7).zero? &&
#        digits.uniq.size == digits.size
#       return number
#     end   
#   end
# end

# alt w/ incrementing by 14 after incrementing to an odd multiple of 7

def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    digits = number.to_s.chars
    return number if digits == digits.uniq
    number += 14
    break if number > 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)