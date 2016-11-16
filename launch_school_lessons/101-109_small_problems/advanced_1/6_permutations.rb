def permutations(array)

  return [array] if array.size == 1

  result = []
  array.each_with_index do |element, index|
    sub_array = array[0...index] + array[(index+1)..-1]
    sub_permutations = permutations(sub_array)
    sub_permutations.each do |permutation|
      result << [element] + permutation
    end
  end
  result
end

# alt 

# def permutations(arr)
#   return [arr] if arr.size == 1

#   results = []
#   arr.each do |num|
#     arr_without_num = arr.reject { |element| element == num }
#     permutations_without_num = permutations(arr_without_num)
#     results += permutations_without_num.map { |perm| perm.unshift(num) }
#   end

#   results
# end

# alt

# def permutations(array)
#   return [array] if array.size == 1
#   result = []
#   array.map do |item|
#     first, rest = item, array - [item]
#     permutations(rest).each { |permutations| result << [first, permutations].flatten }
#   end
#   result
# end

# alt Heap's algorithm

# def permutations(array, n = array.size)
#   if n == 1
#     p array
#     return array

#   else
#     for i in 0..(n-1)
#       permutations(array, n-1)
#       if n.even?
#         array[i], array[n-1] = array[n-1], array[i]
#       else
#         array[0], array[n-1] = array[n-1], array[0]
#       end
#     end
#   end

# end

# p permutations([2])
# puts
# p permutations([1, 2])
# puts
p permutations([1, 2, 3])
# puts
# p permutations([1, 2, 3, 4])