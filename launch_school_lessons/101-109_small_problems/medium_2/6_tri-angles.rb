# def triangle (angle1, angle2, angle3)
#   angles = [angle1, angle2, angle3]

#   case 
#   when angles.include?(0) || angles.reduce(:+) != 180
#     :invalid
#   when angles.any? { |angle| angle > 90 }
#     :obtuse
#   when angles.include?(90)
#     :right
#   else
#     :acute
#   end
# end

# alt w/ Enumerable#all

# def triangle (angle1, angle2, angle3)
#   angles = [angle1, angle2, angle3]

#   case 
#   when angles.include?(0) || angles.reduce(:+) != 180
#     :invalid
#   when angles.include?(90)
#     :right
#   when angles.all? { |angle| angle < 90 }
#     :acute
#   else
#     :obtuse
#   end
# end

# alt w/ Hash

def triangle (angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if  angles.include?(0) || angles.reduce(:+) != 180
  { -1 => :acute, 0 => :right, 1 => :obtuse}[angles.max <=> 90]
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid