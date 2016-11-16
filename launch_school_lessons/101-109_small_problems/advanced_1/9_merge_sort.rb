def merge(arr1, arr2)
  result = arr1.map { |element| element}
  arr2.each do |element|
    result_starting_size = result.size
    result.each_index do |index|
      if result[index] > element
        result.insert(index, element)
        break
      end
    end
    result << element if result.size == result_starting_size
  end
  result
end

# def merge_sort(array)
#   result = []
#   return array if array.size == 1
#   sub_arrays = [array.slice!(0, array.size/2)] + [array]
#   sub_arrays.each do |sub_array|
#     result << merge_sort(sub_array)
#     if result.size == 2
#       result = merge(result[0], result[1])
#     end
#   end
#   result
# end

# alt LS solution

# def merge_sort(array)
#   return array if array.size == 1

#   sub_array_1 = array[0...array.size / 2]
#   sub_array_2 = array[array.size / 2...array.size]

#   sub_array_1 = merge_sort(sub_array_1)
#   sub_array_2 = merge_sort(sub_array_2)

#   merge(sub_array_1, sub_array_2)
# end

# alt non-recursive (Tovi Newman solution)

def merge_sort(arr)
  singles, result = [], []
  (arr.size).times { |idx| singles << [arr[idx]] }

  until (result.size <= 1 && singles.size <= 1)
    result << merge(singles.shift, singles.shift) while singles.size > 1
    singles << merge(result.shift, result.shift) while result.size > 1
  end

  return merge(singles[0], result[0]) if (result.size == 1 && singles.size == 1)
  singles.size == 1 ? singles[0] : result[0]
end

# p merge_sort([9, 5, 7, 1])
# p merge_sort([5, 3])
# p merge_sort([6, 2, 7, 1, 4])
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46])

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]