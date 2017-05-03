# input integer
# output array of array of integers

# each row is an array of integers
# Row 1 is 1
# Each row has one more element than the last
# Compute value for each element:
  # previous array[index minus 1] + previous array[index]
  # if either are nil, treat as zero

# methods
  # rows => return rows

require 'pry'

class Triangle
  attr_reader :number_of_rows

  def initialize(number_of_rows)
    @number_of_rows = number_of_rows
  end

  def rows
    rows = [[1]]
    row_idx = 1

    2.upto(@number_of_rows) do |number_of_elements|
      row = []
      previous_row = rows[row_idx-1]

      number_of_elements.times do |idx|
        first_value = idx.zero? ? 0 : previous_row[idx - 1]
        second_value = previous_row[idx].nil? ? 0 : previous_row[idx]

        row << first_value + second_value
      end

      rows << row
      row_idx += 1
    end

    rows
  end
end