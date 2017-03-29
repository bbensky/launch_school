# for a given number
  # add the number to the sum if it is a multiple of any one of the set
  # how is it a multiple? if the reaminder of divinging the number by the set
  # number is zero

require 'pry'

# class SumOfMultiples
#   def initialize(*args)
#     @set = args
#   end

#   def to(upper_limit)
#     (1...upper_limit).each_with_object([]) do |num, result|
#       @set.each do |set_num|
#         if (num % set_num).zero?
#           result << num
#           break
#         end
#       end
#     end.reduce(*:+)
#   end

#   def self.to(upper_limit)
#     result = 0

#     (1...upper_limit).each do |num|
#       [3, 5].each do |set_num|
#         if (num % set_num).zero?
#           result += num
#           break
#         end
#       end
#     end

#     result
#   end
# end

# alt

# class SumOfMultiples
#   def initialize(*args)
#     @set = args
#   end

#   def to(upper_limit)
#     (1...upper_limit).reduce(0) do |result, num|
#       @set.any? { |set_num| (num % set_num).zero? } ? result + num : result
#     end
#   end

#   def self.to(upper_limit)
#     (1...upper_limit).reduce(0) do |result, num|
#       [3, 5].any? { |set_num| (num % set_num).zero? } ? result + num : result
#     end
#   end
# end

# alt w/o duplicate method

# class SumOfMultiples
#   def initialize(*args)
#     @set = args
#   end

#   def to(upper_limit)
#     (1...upper_limit).reduce(0) do |result, num|
#       @set.any? { |set_num| (num % set_num).zero? } ? result + num : result
#     end
#   end

#   def self.to(upper_limit)
#     SumOfMultiples.new(3, 5).to(upper_limit)
#   end
# end

# alt reversed

# class SumOfMultiples
#   def initialize(*args)
#     @set = args
#   end

#   def to(upper_limit)
#     self.class.to(upper_limit, @set)
#   end

#   def self.to(upper_limit, multiples=[3, 5])
#     (1...upper_limit).reduce(0) do |result, num|
#       multiples.any? { |set_num| (num % set_num).zero? } ? result + num : result
#     end
#   end
# end

# alt w/ select

class SumOfMultiples
  def initialize(*args)
    @set = args
  end

  def to(upper_limit)
    self.class.to(upper_limit, @set)
  end

  def self.to(upper_limit, multiples=[3, 5])
    (1...upper_limit).select do |num|
      multiples.any? { |multiple| (num % multiple).zero? }
    end.reduce(0, &:+)
  end
end

sum = SumOfMultiples.new(7, 13, 17).to(20)
p sum