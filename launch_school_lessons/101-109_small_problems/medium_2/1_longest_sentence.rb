text = File.read('sample_text.txt')

# sentences = text.split(/[.!?]/)

# longest_sentence = []

# sentences.each do |sentence|
#   if sentence.split.length > longest_sentence.length
#     longest_sentence = sentence.split
#   end
# end

# puts "The longest sentence is:"
# puts longest_sentence.join(' ').strip
# puts "Total words: #{longest_sentence.length}"

# # alt w/ Enumberable#max_by and String#strip

# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence.strip!
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words."

# further exploration

# longest paragraph

# paragraphs = text.split(/^\w*$/)
# largest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
# largest_paragraph.strip!

# number_of_words = largest_paragraph.split.size

# puts "#{largest_paragraph}"
# puts "Containing #{number_of_words} words."

# longest word

words = text.split(/\W+/)
longest_words = []

longest_word_length = words.max_by { |word| word.length }.size

words.each do |word|
  longest_words << word if word.length == longest_word_length
end

puts "The longest words are: #{longest_words.join(', ')}."
puts "They each contain #{longest_word_length} letters."

