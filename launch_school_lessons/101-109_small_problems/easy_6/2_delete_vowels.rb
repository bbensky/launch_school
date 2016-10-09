# def remove_vowels(words)
#   words.each { |word| word.delete!("aeiouAEIOU") }
# end

# alt w/ gsub

# def remove_vowels(words)
#   words.each { |word| word.gsub!(/[aeiou]/i, '') }
# end

# alt w/ map

def remove_vowels(words)
  p words.map { |word| word.gsub(/[aeiou]/i, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']