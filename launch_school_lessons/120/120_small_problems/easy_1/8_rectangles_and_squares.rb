class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

# class Square < Rectangle
#   def initialize(side_length)
#     super(side_length, side_length)
#   end
# end

# alt w/ different initialize

# class Square < Rectangle
#   def initialize(side_length)
#     @height = side_length
#     @width = side_length
#   end
# end

# alt w/ width = height

# class Square < Rectangle
#   def initialize(height, width = height)
#     super
#   end
# end

# alt w/ = = 

class Square < Rectangle
  def initialize(side)
    @height = @width = side
  end
end


square = Square.new(5)
puts "area of square = #{square.area}"