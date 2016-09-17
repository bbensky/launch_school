# The Ruby Array class has several methods for removing items from the array. 
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original
# array between method calls)?

numbers.delete_at(1)

# This deletes from the array and returns the element at the index of the number being passed as an argument.

numbers.delete(1)

# This deletes from the array and returns all elements in the array that are equal to the object
# passed in as an argument.
