# def zip(arr1, arr2)
#   result = []

#   arr1.each_index do |idx|
#     result << [arr1[idx], arr2[idx]]
#   end

#   result
# end

# alt map.with_index

# def zip(arr1, arr2)
#   arr1.map.with_index do |el, idx|
#     [arr1[idx], arr2[idx]]
#   end
# end

# alt w/ Enumerator#each_with_object

def zip(arr1, arr2)
  arr1.each_index.each_with_object([]) do |idx, result|
    result << [arr1[idx], arr2[idx]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]