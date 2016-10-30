# def calculate_percentage(subset, total)
#   percentage = subset / total * 100
#   percentage.to_i == percentage ? percentage.to_i : percentage
# end

# def letter_percentages(string)
#   percentages = {}
#   total_chars = string.chars.size.to_f
#   percentages[:lowercase] = calculate_percentage(string.count('a-z'), total_chars)
#   percentages[:uppercase] = calculate_percentage(string.count('A-Z'), total_chars)
#   percentages[:neither] = calculate_percentage(string.count('^A-Za-z'), total_chars)
#   percentages
# end

def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0}
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }