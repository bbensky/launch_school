# def transpose(matrix)
#   transposed_matrix = []
#   max_index = matrix.size - 1

#   0.upto(max_index) do |column|
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
#   result = []

#   (0..2).each do |column_index|
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end

#   result
# end

# alt w/ map shorter

def transpose(matrix)
  0.upto(matrix.size - 1).map do |col|
    matrix.map do |row|
      row[col]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# further exploration: transpose! method

# def transpose!(matrix)
#   max_index = matrix.size - 1
#   (0..max_index).each do |first|
#     second = first
#     second.upto(max_index) do |second|
#       matrix[first][second], matrix[second][first] = matrix[second][first], matrix[first][second]
#       p matrix
#     end
#   end
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# transpose!(matrix)
# p matrix
# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
