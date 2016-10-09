# def triangle(n)
#   (n+1).times do |stars|
#     puts ('*' * stars).rjust(n)
#   end
# end

# alt w/o Integer#rjust

# def triangle(n)
#   spaces = n - 1
#   stars = 1

#   n.times do |n|
#     puts ' ' * spaces + '*' * stars
#     spaces -= 1
#     stars += 1
#   end
# end

# alt w/ rjust

# def triangle(n)
#   n.times { |stars| puts ('*' * (stars+1)).rjust(n) }
# end

# further exploration

# upside down 

# def triangle(n)
#   spaces = 0
#   stars = n

#   n.times do |n|
#     puts ' ' * spaces + '*' * stars
#     spaces += 1
#     stars -= 1
#   end
# end

# p triangle(5)
# p triangle(9)

# any corner

def triangle(n, corner)
  case corner
  when :top_left then n.times { |spaces| puts '*' * (n-spaces) }
  when :top_right then n.times { |spaces| puts ('*' * (n-spaces)).rjust(n) }
  when :bottom_left then n.times { |stars| puts '*' * (stars+1) }
  when :bottom_right then n.times { |stars| puts ('*' * (stars+1)).rjust(n) }
  end
end

triangle(5, :top_left)
triangle(9, :top_left)
triangle(5, :top_right)
triangle(9, :top_right)
triangle(5, :bottom_left)
triangle(9, :bottom_left)
triangle(5, :bottom_right)
triangle(9, :bottom_right)