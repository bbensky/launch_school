def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').gsub(/[\s]{2,}/, ' ')
end

# alt w/ #squeeze method

# def cleanup(string)
#   string.gsub(/[^a-z]+/, ' ').squeeze(' ')
# end

# alt w/ shorter regex

# def cleanup(string)
#   string.gsub(/[^a-zA-z]+/, ' ')
# end

# def cleanup(string)
#   string.gsub(/\W+/, ' ')
# end

# futher exploration w/o regex

# def cleanup(string)
#   string.chars.map do |char|
#     ('a'..'z').include?(char.downcase) ? char : ' '
#   end.join.squeeze(' ')
# end

# def cleanup(string)
#   string.chars.each_index { |index| string[index] = ' ' unless ('a'..'z').include?(string[index])}
#   string.squeeze(' ')
# end

p cleanup("---what's my +*& line?") == ' what s my line '