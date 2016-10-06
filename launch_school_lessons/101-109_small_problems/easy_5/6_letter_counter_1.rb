# def word_sizes(string)
#   size_counts = Hash.new(0)
#   words = string.split
#   words.each do |word|
#     size_counts[word.length] += 1
#   end
#   size_counts
# end

# alt refactored

# def word_sizes(string)
#   size_counts = Hash.new(0)
#   string.split.each { |word| size_counts[word.length] += 1 }
#   size_counts
# end

# alt w/ Hash#default method

# def word_sizes(string)
#   size_counts = {}
#   size_counts.default = 0
#   string.split.each { |word| size_counts[word.length] += 1 }
#   size_counts
# end

# alt use an array of string sizes
def word_sizes(string)
  size_hash = {}
  size_array = string.split.map(&:size)
  size_array.each do |length|
    size_hash[length] = size_array.count(length) 
  end
  size_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}