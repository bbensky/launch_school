# def substrings_at_start(string)
#   substrings = []
#   1.upto(string.length) do |letters|
#     substrings << string[0, letters]
#   end
#   p substrings
# end

# alt w/ #times

# def substrings_at_start(string)
#   substrings = []
#   string.length.times do |index|
#     substrings << string[0, index]
#   end
#   p substrings
# end

# alt w/ range and indices

# def substrings_at_start(string)
#   substrings = []
#   0.upto(string.length-1) do |index|
#     substrings << string[0..index]
#   end
#   p substrings
# end

# alt w/ Enumberable#map

# def substrings_at_start(string)
#   0.upto(string.size-1).map { |index| p string[0..index] }
# end

# alt w/ String#chop

def substrings_at_start(string)
  substrings = []
  until string.empty?
    substrings << string
    string = string.chop
  end
  substrings.sort
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']