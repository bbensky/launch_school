# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <(other_home)
#     price < other_home.price
#   end

#   def > other_home
#     self.price > other_home.price
#   end
# end

# alt w/ Comparable module and one new method

class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=> other_home
    p price <=> other_home.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
# => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1
# => Home 2 is more expensive