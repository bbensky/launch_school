# def display_non_middle_lines(number_of_lines, starting_spacing, grid_size)
#   spacing = starting_spacing
#   spacing_adjustment = spacing.zero? ? -1 : 1 

#   1.upto(number_of_lines) do |line|
#     puts (('*' + ' ' * spacing) * 2 + '*').center(grid_size)
#     spacing -= spacing_adjustment
#   end
# end

# def display_middle_line(grid_size)
#   puts '*' * grid_size
# end

# def star(grid_size)
#   number_of_up_and_down_lines = grid_size / 2
#   largest_spacing = (grid_size - 3) / 2

#   display_non_middle_lines(number_of_up_and_down_lines, largest_spacing, grid_size)

#   display_middle_line(grid_size)

#   display_non_middle_lines(number_of_up_and_down_lines, 0, grid_size)
# end

# alt method to print a single row, joining stars in an array by the appropriate spaces

def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

star(7)
puts
star(9)
puts
star(11)

