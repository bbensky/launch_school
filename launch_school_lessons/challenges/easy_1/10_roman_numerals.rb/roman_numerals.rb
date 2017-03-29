
require 'pry'

# class Integer

#   THOUSANDS = { 1 => 'M' }
#   HUNDREDS = { 9 => 'CM', 5 => 'D', 4 => 'CD', 1 => 'C'}
#   TENS = { 9 => 'XC', 5 => 'L', 4 => 'XL', 1 => 'X' }
#   ONES = { 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

#   def to_roman
#     roman_string = ''

#     # thousands
#     thousands = self / 1000
#     remainder = self % 1000

#     roman_string << convert(thousands, THOUSANDS)

#     # hundreds
#     hundreds = remainder / 100
#     remainder = remainder % 100

#     roman_string << convert(hundreds, HUNDREDS)

#     # tens
#     tens = remainder / 10

#     roman_string << convert(tens, TENS)

#     ones = remainder % 10

#     roman_string << convert(ones, ONES)
#     roman_string
#   end

#   def convert(number, place)
#     roman_string = ''
#     if number == 9
#       roman_string << place[9]
#     elsif number >= 5
#       roman_string << place[5]
#       roman_string << place[1] * (number % 5)
#     elsif number == 4
#       roman_string << place[4]
#     else
#       roman_string << place[1] * number
#     end
#     roman_string
#   end
# end

# alt refactored

# class Integer
#   THOUSANDS = { 1 => 'M' }
#   HUNDREDS = { 9 => 'CM', 5 => 'D', 4 => 'CD', 1 => 'C'}
#   TENS = { 9 => 'XC', 5 => 'L', 4 => 'XL', 1 => 'X' }
#   ONES = { 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

#   def to_roman
#     thousands = self / 1000
#     hundreds  = self % 1000 / 100
#     tens      = self % 1000 % 100 / 10
#     ones      = self % 1000 % 100 % 10

#     roman_string = ''
#     roman_string << convert(thousands, THOUSANDS)
#     roman_string << convert(hundreds, HUNDREDS)
#     roman_string << convert(tens, TENS)
#     roman_string << convert(ones, ONES)
#     roman_string
#   end

#   def convert(number, place)
#     roman_string = ''
#     case number
#     when 9    then roman_string << place[9]
#     when 5..8 then roman_string << place[5] << (place[1] * (number % 5))
#     when 4    then roman_string << place[4]
#     else           roman_string << place[1] * number
#     end
#     roman_string
#   end
# end

# alt with #each

class Integer
  ROMANS = { 'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
             'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
             'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 }

  def to_roman
    num = self
      ROMANS.each_with_object('') do |(roman, integer), result|
        place_num = num / integer

        result << roman * place_num

        num -= place_num * integer
      end
  end
end


