sentence = "Humpty Dumpty sat on a wall."

puts sentence.delete('.').split.reverse.join(' ').+('.')

# alt

words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'
puts backwards_sentence