class Octal
  def initialize(string)
    @digits = convert_string(string)
  end

  def to_decimal
    @digits.each_with_index.reduce(0) do |result, (num, idx)|
      result + (num * (8**idx))
    end
  end

  private

  def convert_string(string)
    if valid_input? string
      string.split('')
            .reverse
            .map(&:to_i)
    else
      [0]
    end
  end

  def valid_input?(string)
    string.chars.none? do |char|
      char.to_i.to_s != char || [8, 9].include?(char.to_i)
    end
  end
end
