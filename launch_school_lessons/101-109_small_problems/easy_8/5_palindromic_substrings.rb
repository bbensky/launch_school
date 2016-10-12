def substrings(string)
  substrings = []
  string.length.times do
    1.upto(string.length) do |letters|
      substrings << string[0, letters]
    end
    string = string[1..-1]
  end
  substrings
end

# def palindromes(string)
#   palindromes = []
#   substrings(string).each do |substring|
#     if substring.length > 1
#       palindromes << substring if substring.reverse == substring
#     end
#   end
#   p palindromes
# end

# alt w/ helper method

# def palindrome?(string)
#   string == string.reverse && string.length > 1
# end

# def palindromes(string)
#   palindromes = []
#   substrings(string).each do |substring|
#     palindromes << substring if palindrome?(substring)
#   end
#   p palindromes
# end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# further exploration

def substrings(string)
  substrings = []
  string.length.times do
    1.upto(string.length) do |letters|
      substrings << string[0, letters]
    end
    string = string[1..-1]
  end
  substrings
end

def palindrome?(string)
  alphanumeric = string.gsub(/[^a-z0-9]/i, '').downcase
  alphanumeric == alphanumeric.reverse && alphanumeric.length > 1
end

def palindromes(string)
  palindromes = []
  substrings(string).each do |substring|
    palindromes << substring if palindrome?(substring)
  end
  p palindromes
end