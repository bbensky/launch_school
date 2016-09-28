# def palindrome?(string)
#   string.eql?(string.reverse)
# end

# alt

# def palindrome?(string)
#   (string <=> string.reverse) == 0
# end

# alt

# def palindrome?(string)
#   string.chars == string.chars.reverse
# end

# alt

def palindrome?(string)
  str_array = string.chars
  rev_array = []
  string.length.times do
    rev_array << str_array.pop
  end
  string.chars == rev_array
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

#further exploration:

def palindrome_array?(array)
  array == array.reverse
end

def palindrome_array_or_string?(array_or_string)
  array_or_string == array_or_string.reverse
end