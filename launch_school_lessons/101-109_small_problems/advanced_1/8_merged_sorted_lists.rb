require 'pry'

# def merge(arr1, arr2)
#   result = []
#   max_index = arr1.size > arr2.size ? arr1.size - 1 : arr2.size - 1

#   0.upto(max_index) do |index|
#     ordered_pair = []

#     if arr1[index] == nil
#       ordered_pair << arr2[index]
#     elsif arr2[index] == nil
#       ordered_pair << arr1[index]
#     else
#       ordered_pair = arr1[index] <= arr2[index] ? [arr1[index], arr2[index]] : [arr2[index], arr1[index]]
#     end
    
#     if result.empty? 
#       result = ordered_pair
#     else
#       ordered_pair.each do |element|
#         if result.last < element
#           result << element
#         else
#           result << element
#           result[-2], result[-1] = result[-1], result[-2]
#         end
#       end
#     end
#   end

#   p result
# end

# alt return one array if the other is empty

# def merge(arr1, arr2)
#   return arr1 if arr2.empty?
#   return arr2 if arr1.empty?

#   result = []

#   max_index = arr1.size > arr2.size ? arr1.size - 1 : arr2.size - 1

#   0.upto(max_index) do |index|
#     ordered_pair = []

#     if arr1[index] == nil
#       ordered_pair << arr2[index]
#     elsif arr2[index] == nil
#       ordered_pair << arr1[index]
#     else
#       ordered_pair = arr1[index] <= arr2[index] ? [arr1[index], arr2[index]] : [arr2[index], arr1[index]]
#     end
    
#     if result.empty? 
#       result = ordered_pair
#     else
#       ordered_pair.each do |element|
#         if result.last < element
#           result << element
#         else
#           result << element
#           result[-2], result[-1] = result[-1], result[-2]
#         end
#       end
#     end
#   end

#   result
# end

# alt w/ insert

# def merge(arr1, arr2)
#   result = arr1.map { |element| element}

#   arr2.each do |element|
#     result_starting_size = result.size
#     result.each_index do |index|
#       if result[index] > element
#         result.insert(index, element)
#         break
#       end
#     end
#     result << element if result.size == result_starting_size
#   end
#   result
# end

# alt LS solution

# def merge(array1, array2)
#   index2 = 0
#   result = []

#   array1.each do |value|
#     while index2 < array2.size && array2[index2] <= value
#       result << array2[index2]
#       index2 += 1
#     end
#     result << value
#   end
#   result.concat(array2[index2..-1])
# end

# alt only push minimum value

# def merge(array1, array2)
#   joined_array = array1 + array2
#   result = []

#   joined_array.size.times do 
#     result << joined_array.delete_at(joined_array.index(joined_array.min))
#   end

#   result
# end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]