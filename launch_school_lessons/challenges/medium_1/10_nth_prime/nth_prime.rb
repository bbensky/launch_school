require 'pry'

class Prime
  def self.nth(number)
    raise ArgumentError if number.zero?
    primes = []
    num = 2

    while primes.length < number
      primes << num if is_prime?(num)
      num += 1
    end

    primes.last
  end

  # alt optimized

  def self.nth(number)
    fail ArgumentError if number < 1
    primes = [2]
    num = 3

    until primes.size == number
      primes << num if is_prime?(num)
      num += 2
    end

    primes.last
  end

  def self.is_prime?(number)
    upper_limit = Math.sqrt(number).to_i
    (2..upper_limit).none? { |num| (number % num).zero? }
  end
end

