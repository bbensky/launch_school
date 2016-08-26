words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

arr = Array.new

words.each do |word|
  arr.each do |arr_word|
    words.delete(arr_word)
  end  
  arr = []
  words.each do |comp_word|
    if (word != comp_word) && (word.chars.sort == comp_word.chars.sort)
      arr.push(word, comp_word)
    end  
  end  
  p arr.uniq
end  
