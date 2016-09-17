(0..9).each { |x| puts 'The Flintstones Rock'.insert(0, ' ' * x) }

# alt

(0..9).step { |x| puts 'The Flintstones Rock'.insert(0, ' ' * x) }

# alt2

statement = "The Flintstones Rock"

result = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_count = statement.scan(letter).count
  result[letter] = letter_count if letter_count > 0
end

puts result