def titleize (string)
  capitalized_words = string.split.each do |word|
                        word.capitalize
                      end
  return capitalized_words.join(' ')                    
end

titleize("hickory dickory dock.")

# alt

words.split.map { |word| word.capitalize }.join(' ')