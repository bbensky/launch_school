# def swap(string)
#   word_array = string.split
#   word_array.map! do |word|
#     first_letter = word[0]
#     second_letter = word[-1]
#     word[0] = second_letter
#     word[-1] = first_letter
#     word
#   end
#   word_array.join(' ')
# end

# alt

# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end

# def swap(string)
#   string.split.map { |word| swap_first_and_last(word) }.join(' ')
# end

# alt w/ ternary

def swap(string)
  string.split.map do |word|
    word.length > 1 ? word[-1] + word[1..-2] + word[0] : word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# further exploration

# That would return an array with elements word[0] and word[1] instead of
# the full word.