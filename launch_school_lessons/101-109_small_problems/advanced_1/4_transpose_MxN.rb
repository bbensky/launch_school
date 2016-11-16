# def transpose(matrix)
#   transposed_matrix = []
#   number_of_columns = matrix.first.size -1

#   0.upto(number_of_columns) do |column|
#     new_row = []
#     matrix.each_index do |row|
#       new_row << matrix[row][column]
#     end
#     transposed_matrix << new_row
#   end

#   transposed_matrix
# end

# alt w/ map

# def transpose(matrix)
#   transposed_matrix = []
#   number_of_columns = matrix.first.size - 1

#   0.upto(number_of_columns) do |column|
#     new_row = matrix.map { |row| row[column] }
#     transposed_matrix << new_row
#   end
#   p transposed_matrix
# end

 # alt shorter
 
def transpose(matrix)
  0.upto(matrix.first.size - 1).map do |col|
    matrix.map do |row|
      row[col]
    end
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]