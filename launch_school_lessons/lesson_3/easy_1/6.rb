# Show two different ways to put the expected "Four score and " in front of the string.

famous_words = "seven years ago..."


famous_words.insert(0, 'Four score and ')

famous_words.prepend('Four score and ')

"Four score and " + famous_words
