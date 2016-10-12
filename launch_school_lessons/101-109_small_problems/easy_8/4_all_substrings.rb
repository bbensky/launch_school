# def substrings_at_start(string)
#   substrings = []
#   1.upto(string.length) do |letters|
#     substrings << string[0, letters]
#   end
#   substrings
# end

# def substrings(string)
#   substrings = []
#   string.size.times do
#     substrings << substrings_at_start(string)
#     string.slice!(0)
#   end
#   p substrings.flatten
# end

# alt w/o mutating method argument

# def substrings(string)
#   substrings = []
#   string.size.times do |starting_element|
#     substrings << substrings_at_start(string[starting_element..-1])
#   end
#   p substrings.flatten
# end

# alt one method

def substrings(string)
  substrings = []
  string.length.times do
    1.upto(string.length) do |letters|
      substrings << string[0, letters]
    end
    string = string[1..-1]
  end
  p substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]