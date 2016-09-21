def reverse_sentence(string)
  string.split.reverse.join(' ')
end

def reverse_sentence_pop(string)
  reversed_array = []
  split_string = string.split

  until split_string.empty?
    reversed_array << split_string.pop
  end

  reversed_array.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

puts reverse_sentence_pop('') == ''
puts reverse_sentence_pop('Hello World') == 'World Hello'
puts reverse_sentence_pop('Reverse these words') == 'words these Reverse'