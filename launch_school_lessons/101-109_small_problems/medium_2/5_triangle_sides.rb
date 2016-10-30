# def triangle(l1, l2, l3)
#   sides = [l1, l2, l3].sort
  
#   if sides.any? { |side| side <= 0 } || sides[0] + sides[1] <= sides[2]
#     return :invalid
#   end

#   return :equilateral if sides.reduce(:+) / 3 == sides[0]

#   sides.each_with_index do |side, index|
#     return :isosceles if side == sides[index+1]
#   end

#   :scalene
# end

# alt w/ case

# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3]
#   largest_side = sides.max
  
#   case
#   when sides.include?(0) || 2 * largest_side > sides.reduce(:+)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side2 == side3 || side1 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end

# alt with uniq

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max
  
  case
  when sides.include?(0) || 2 * largest_side > sides.reduce(:+)
    :invalid
  when sides.uniq.length == 1
    :equilateral
  when sides.uniq.length == 2
    :isosceles
  else
    :scalene
  end
end
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid