class RailFenceCipher
  def self.encode(string, number_of_rows)
    encoding_array = generate_array(string, number_of_rows)
    row_loop = generate_row_loop(number_of_rows)
    string_index = 0
    
    loop do
      break if string_index >= string.length
      row_loop.each do |row_idx|
        encoding_array[row_idx][string_index] = string[string_index]
        string_index += 1
      end
    end

    result = ''

    encoding_array.each do |row|
      result << row.join
    end

    result
  end

  def self.decode(string, number_of_rows)
    unfilled_array = generate_array(string, number_of_rows)
    row_loop = generate_row_loop(number_of_rows)
    string_index = 0
    
    loop do
      break if string_index >= string.length
      row_loop.each do |row_idx|
        unfilled_array[row_idx][string_index] = :x
        string_index += 1
        break if string_index >= string.length
      end
    end

    result = String.new
    string_index = 0

    unfilled_array.each do |row|
      row.each_index do |row_idx|
        row[row_idx] = string[string_index] if row[row_idx] == :x
        string_index += 1 if row[row_idx] != ''
      end
    end

    result = String.new
    string_index = 0
    
    loop do
      break if string_index >= string.length
      row_loop.each do |row_idx|
        char = unfilled_array[row_idx][string_index]
        result << char
        string_index += 1
        break if string_index >= string.length
      end
    end

    result
  end

  def self.generate_array(string, number_of_rows)
    string_length = string.size.zero? ? 1 : string.size

    arr = []

    number_of_rows.times do 
      row = [''] * string.length
      arr << row
    end

    arr
  end

  def self.generate_row_loop(number_of_rows)
    rows = (0..number_of_rows-1).to_a
    reverse_rows = rows.reverse[1..-2]
    rows + reverse_rows
  end
end

p RailFenceCipher.decode('TEITELHDVLSNHDTISEIIEA', 3)

