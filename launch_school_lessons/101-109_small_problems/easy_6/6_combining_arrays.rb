# def merge(array1, array2)
#   (array1 + array2).uniq
# end

# alt w/ Array#|

# def merge(array1, array2)
#   array1 | array2
# end

# alt w/ Array#<< and Array#flatten

def merge(array1, array2)
  (array1 << array2).flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]