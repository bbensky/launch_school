# def rotate90(matrix)
#   transposed_matrix = []
#   max_index = matrix.first.size - 1

#   0.upto(max_index) do |column|
#     new_row = []
#     matrix.each_index do |row|
#       new_row << matrix[row][column]
#     end
#     transposed_matrix << new_row.reverse
#   end

#   p transposed_matrix
# end

# alt w/ map

# def rotate90(matrix)
#   transposed_matrix = []
#   number_of_columns = matrix.first.size - 1

#   0.upto(number_of_columns) do |column|
#     new_row = matrix.map { |row_index| row_index[column] }
#     transposed_matrix << new_row.reverse
#   end
#   transposed_matrix
# end

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# further exploration

def rotate90(matrix)
  transposed_matrix = []
  number_of_columns = matrix.first.size - 1

  0.upto(number_of_columns) do |column|
    new_row = matrix.map { |row| row[column] }
    transposed_matrix << new_row.reverse
  end
  transposed_matrix
end

def rotate_any(matrix, degrees)
  repetitions = degrees / 90
  repetitions.times do 
    matrix = rotate90(matrix)
  end
  matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# p rotate_any(matrix1, 90)
# p rotate_any(matrix1, 180)
# p rotate_any(matrix1, 270)
# p rotate_any(matrix1, 360)
p rotate_any(matrix2, 90)
p rotate_any(matrix2, 180)
p rotate_any(matrix2, 270)
p rotate_any(matrix2, 360)
