require 'pry'

class Triplet
  attr_reader :numbers

  def initialize(num1, num2, num3)
    @numbers = [num1, num2, num3]
  end

  def sum
    @numbers.reduce(&:+)
  end

  def product
    @numbers.reduce(&:*)
  end

  def pythagorean?
    (@numbers[0]**2 + @numbers[1]**2) == @numbers[2]**2
  end

  def self.where(sum: nil, min_factor: nil, max_factor: nil)
    low_factor = min_factor ? min_factor : 1

    perms = (low_factor..max_factor).to_a.permutation(3).to_a

    if sum
      perms = perms.select { |perm| perm.reduece(:+) == sum }
    end

    result = []

    perms.each do |perm|
      triplet = self.new(perm[0], perm[1], perm[2])
      pythagorean = triplet.pythagorean? 
      uniqe = result.none? do |result_triplet|
          result_triplet_nums = result_triplet.numbers
          triplet_nums = triplet.numbers

          (result_triplet_nums[2] == triplet_nums[2]) &&
          ([result_triplet_nums[1], result_triplet_nums[0]] ==
          [triplet_nums[0], triplet_nums[1]])
      end
      result << triplet if pythagorean && uniqe
    end

    result
  end
end

 triplets = Triplet.where(max_factor: 10)
 p triplets