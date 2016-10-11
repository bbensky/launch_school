# def word_cap(string)
#   string.split.map { |word| word.capitalize }.join(' ')
# end

# alt more concise

# def word_cap(string)
#   p string.split.map(&:capitalize).join(' ')
# end

# further exploration

# def word_cap(string)
#   words_array = string.downcase.split
#   words_array.map! do |word|
#     word[0] = word[0].upcase
#     word
#   end
#   p words_array.join(' ')
# end

# alt using index and ' '

# def word_cap(string)
#   chars_array = string.downcase.chars
#   chars_array.each_with_index do |char, index|
#     char.upcase! if index.zero? || chars_array[index-1] == ' '
#   end
#   p chars_array.join
# end

# alt using string indices

def word_cap(string)
  string.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'