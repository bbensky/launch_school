# def missing(array)
#   result = []

#   array.each_with_index do |el, idx|
#     first = array[idx]
#     second = array[idx+1]
#     break if second == nil
#     next if (first..second).size == 2

#     num = first + 1
#     while num < second
#       result << num
#       num += 1
#     end
#   end

#   result
# end

# alt

# def missing(array)
#   result = []
#   counter = 0

#   while counter < array.size - 1

#     if array[counter] != array[counter+1]

#       num = array[counter] + 1
#       while num < array[counter+1]
#         result << num
#         num += 1
#       end

#     end

#     counter += 1
#   end

#   result
# end

def missing(array)
  result = []

  array.each_cons(2) do |first, second|
    result.concat(((first+1)..(second-1)).to_a)
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []