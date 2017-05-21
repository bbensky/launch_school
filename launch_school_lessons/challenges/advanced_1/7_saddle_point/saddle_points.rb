class Matrix

  def initialize(matrix_string)
    @matrix = convert_string_to_matrix(matrix_string)
  end

  def rows
    @matrix
  end

  def columns
    result = []
    max_index = @matrix.first.size - 1

    0.upto(max_index) do |idx|
      result << rows.map { |row| row[idx] }
    end

    result
  end

  def saddle_points
    result = []

    @matrix.each_with_index do |row, row_idx|

      row.each_with_index do |num, col_idx|
        if (num == row.max) && (num == columns[col_idx].min)
          result << [row_idx, col_idx]
        end
      end

    end

    result
  end

  private

  def convert_string_to_matrix(matrix_string)
    split_rows = matrix_string.split("\n")
    split_cols = split_rows.map { |row| row.split }
    split_cols.map { |col| col.map(&:to_i) }
  end
end

matrix = Matrix.new("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7")
p matrix.saddle_points

