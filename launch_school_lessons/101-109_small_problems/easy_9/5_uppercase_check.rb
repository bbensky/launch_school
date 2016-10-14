# def uppercase?(string)
#   string == string.upcase
# end

# alt w/ regex

def uppercase?(string)
  string =~ /[a-z]/ ? false : true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# further exploration

# I don't think it should return false, because if the string
# only had non-alphanumeric characters it would also return true.