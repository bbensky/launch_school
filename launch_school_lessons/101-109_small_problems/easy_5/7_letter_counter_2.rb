# def word_sizes(string)
#   counts = Hash.new(0)
#   separate_words = string.split.map { |word| word.delete('[^a-zA-Z]i') }
#   separate_words.each { |word| counts[word.length] += 1 }
#   counts
# end

# alt w/ #gsub

# def word_sizes(string)
#   counts = Hash.new(0)
#   separate_words = string.split.map { |word| word.gsub(/[^a-z]/i, '') }
#   separate_words.each { |word| counts[word.length] += 1 }
#   counts
# end

# alt w/ one iterator method

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    only_letters = word.delete('^a-zA-Z')
    counts[only_letters.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}