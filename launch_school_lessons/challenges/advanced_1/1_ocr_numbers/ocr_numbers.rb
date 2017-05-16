class OCR
  NUMBERS = { 0 => [" _ ", "| |", "|_|", "   "], 
              1 => ["   ", "  |", "  |", "   "],
              2 => [" _ ", " _|", "|_ ", "   "],
              3 => [" _ ", " _|", " _|", "   "],
              4 => ["   ", "|_|", "  |", "   "],
              5 => [" _ ", "|_ ", " _|", "   "],
              6 => [" _ ", "|_ ", "|_|", "   "],
              7 => [" _ ", "  |", "  |", "   "],
              8 => [" _ ", "|_|", "|_|", "   "],
              9 => [" _ ", "|_|", " _|", "   "] }

  def initialize(text)
    @text = text
  end

  def convert
    rows = []
    
    lines = @text.split("\n")
    raise ArgumentError unless ((lines.size + 1) % 4).zero? 

    rows << lines.shift(4) until lines.empty?
    rows.last << " " * rows.first.first.length
    result = []

    rows.each { |row| result << convert_lines(row) }
    result.join(',')
  end

  private

  def convert_lines(row)
    result = ''
    numbers = split_numbers(row)

    numbers.each do |number|
      converted_number = NUMBERS.key(number)
      if converted_number
        result << converted_number.to_s
      else
        result << '?'
      end
    end
    result
  end

  def split_numbers(row)
    lines_array = []
    row.each do |line|
      line_array = []

      loop do
        section = ''

        3.times do
          break if line.empty?
          section << line.slice!(0)
        end

        section << ' ' until section.length == 3
        line_array << section
        break if line.empty?
      end 

      lines_array << line_array

      if lines_array.last.size < lines_array.first.size
        elements_to_enter = lines_array.first.size - lines_array.last.size
        elements_to_enter.times { lines_array.last << lines_array.last[0] }
      end
    end

    numbers = []

    lines_array.first.each_index do |idx|
      number = []

      lines_array.each do |line|
        number << line[idx]
      end

      numbers << number
    end

    numbers
  end

  def correct_size?
    @lines.size % 4 == 0
  end
end

text = <<-NUMBER.chomp
    _  _     _  _  _  _  _  _
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|

NUMBER

# text = <<-NUMBER.chomp
#     _  _
#   | _| _|
#   ||_  _|

#     _  _
# |_||_ |_
#   | _||_|

#  _  _  _
#   ||_||_|
#   ||_| _|

# NUMBER

p OCR.new(text).convert