# def halvsies(array)
#   array2 = []
#   counter = 0

#   return [array, array2] if array.length <= 1

#   while counter <= array.length / 2
#     array2.unshift(array.pop)
#     counter += 1
#   end

#   [array, array2]
# end

# alt w/ Float#ceil

# def halvsies(array)
#   first_half = array.slice(0, (array.length/2.0).ceil)
#   second_half = array.slice(first_half.size, array.size - first_half.size)
#   [first_half, second_half]
# end

# alt w/ Array#take and Array#drop

def halvsies(array)
  half = (array.length / 2.0).round
  [array.take(half), array.drop(half)]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]