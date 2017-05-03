require 'pry'

class Palindromes
  def initialize(max_factor: 1, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    @palindromes = []
    factors = (@min_factor..@max_factor).to_a
    factor_pairs = factors.product(factors).map(&:sort).uniq

    factor_pairs.each do |num1, num2|
      product = num1 * num2
      @palindromes << [product, [num1, num2]] if is_palindrome?(product)
    end
  end

  def largest
    largest_palindrome = @palindromes.max { |a, b| a[0] <=> b[0] }.first

    largest_pairs = select_pairs(largest_palindrome)

    Pairs.new(largest_palindrome, largest_pairs)
  end

  def smallest
    smallest_palindrome = @palindromes.min { |a, b| a[0] <=> b[0] }.first

    smallest_pairs = select_pairs(smallest_palindrome)

    Pairs.new(smallest_palindrome, smallest_pairs)
  end

  private

  def is_palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def select_pairs(number)
    @palindromes.select { |palindrome| palindrome[0] == number }
                .map { |pair| pair[1] }
  end
end

class Pairs
  def initialize(number, pairs)
    @number = number
    @pairs = pairs
  end

  def value
    @number
  end

  def factors
    @pairs
  end
end

palindromes = Palindromes.new(max_factor: 9)
palindromes.generate
palindromes.largest