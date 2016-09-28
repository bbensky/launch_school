def multiply(first_num, second_num)
  (array = first_num, second_num).inject(:*)
end

p multiply([5, 2, 3], 3)

# # Further Exploration:
# # If the first argument is an array, the method will
# # return an array that repeats the values from the
# first argument array in order, second argument number of times.