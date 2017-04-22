#Methods:

# Adjust each digit, from left-to-right, based on rules 
  # double second digit
  # if that digit is greater than 10, subtract 9

# Create a checksum by adding the digits together

# Validate whether a number meets Luhn criteria
  # Is the sum modulus 10 equal to zero?

# Create a check digit to make the number valid
  # This is a CLASS METHOD
  # Run the number through the above methods, but with 
      # a zero at the end. 
  # Subtract the remainder of sum modulus 10 from 10, replace
      # the last number with that number

require 'pry'

class Luhn
  attr_reader :digits

  def initialize(number)
    @digits = split_digits(number)
  end

  def addends
    digits = @digits.clone
    last_idx = -@digits.length

    -1.downto(last_idx) do |idx|
      if idx.even? 
        digits[idx] *=2
        digits[idx] -= 9 if digits[idx] > 10 
      end
    end

    digits
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(number)
    luhn = self.new(number)
 
    luhn.digits.push(0)

    return luhn.digits.join.to_i if luhn.valid?

    sum = luhn.checksum
    remainder = sum % 10

    last_digit = 10 - remainder

    luhn.digits[-1] = last_digit

    luhn.digits.join.to_i
  end

  private

  def split_digits(number)
    number.to_s.chars.map { |char| char.to_i }
  end
end

p Luhn.create(123)

