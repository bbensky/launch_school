# def display(stars, num)
#   puts ("*" * num).center(stars) if num.odd?
# end

# def diamond(stars)
#   1.upto(stars-2) do |num|
#     display(stars, num)
#   end

#   stars.downto(1) do |num|
#     display(stars, num)
#   end
# end

# alt w/ one loop

# def diamond(width)
#   stars = 1

#   1.upto(width) do |line|
#     puts ("*" * stars).center(width)
#     line > (width / 2) ? stars -= 2 : stars += 2
#   end
# end

# diamond(1)
# puts
# diamond(3)
# puts
# diamond(9)

# further exploration: print the outline of the diamond

def diamond(total_lines)
  stars = 1

  1.upto(total_lines) do |line_width|
    if stars == 1
      puts '*'.center(total_lines)
    else
      space = ' ' * (stars - 2)
      puts ('*' + space + '*').center(total_lines)
    end
    line_width > (total_lines / 2) ? stars -= 2 : stars += 2
  end
end

diamond(1)
puts
diamond(3)
puts
diamond(9)
