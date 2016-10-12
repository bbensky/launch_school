# def center_of(string)
#   midpoint = string.length / 2
#   if string.length.odd?
#     string[midpoint]
#   else
#     string[midpoint-1..midpoint]
#   end
# end

# alt w/0 string range

# def center_of(string)
#   midpoint = string.length / 2
#   if string.length.odd?
#     string[midpoint]
#   else
#     string[midpoint-1, 2]
#   end
# end

# alt shorter

# def center_of(string)
#   middle = string.length / 2
#   return string[middle - 1, 2] if string.length.even?
#   string[middle]
# end

# alt ternary

# def center_of(string)
#   middle = string.length / 2
#   string.length.even? ? string[middle - 1, 2] : string[middle]
# end

# alt w/ slice

def center_of(string)
  middle = string.length / 2
  string.length.even? ? string.slice(middle - 1, 2) : string.slice(middle)
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'