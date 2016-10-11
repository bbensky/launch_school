# def interleave(array1, array2)
#   result = []
#   array1.size.times do |index|
#     result.push array1[index]
#     result.push array2[index]
#   end
#   result
# end

# alt w/ <<

def interleave(array1, array2)
  result = []
  array1.size.times do |index|
    result << array1[index] << array2[index]
  end
  result 
end


# alt w/ Enumberable#each_with_index

# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index] 
#   end
#   result
# end

# further exploration w/ #zip

# def interleave(array1, array2)
#   array1.zip(array2).flatten
# end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']