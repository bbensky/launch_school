# ENGLISH_NUMBERS = [
#   "zero", "one", "two", "three", "four", "five",
#   "six", "seven", "eight", "nine", "ten", "eleven", 
#   "twelve", "thirteen", "fourteen", "fifteen", "sixteen", 
#   "seventeen", "eighteen", "nineteen"
# ]

# alt constant

ENGLISH_NUMBERS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(array)
#   sorted_english_integers = []
#   ENGLISH_NUMBERS.sort.each do |num_string|
#     sorted_english_integers << ENGLISH_NUMBERS.index(num_string)
#   end
#   sorted_english_integers
# end

# w/ #sort_by

def alphabetic_number_sort(array)
  p array.sort_by { |number| ENGLISH_NUMBERS[number] }
end

# w/ #sort

def alphabetic_number_sort(array)
  p array.sort { |a, b| ENGLISH_NUMBERS[a] <=> ENGLISH_NUMBERS[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# further exploration

# I'm not entirely sure why one would use Ennumerable#sort_by instead of Array$#sort_by!.
# They both pass the test.