# def multiply_list(arr1, arr2)
#   products = []
#   arr1.each_with_index { |number, index| products << number * arr2[index] }
#   p products
# end

# alt slightly shorter

# def multiply_list(arr1, arr2)
#   products = []
#   arr1.each_with_index { |number, index| products << number * arr2[index] }
#   p products
# end

# alt w/ #each_index

# def multiply_list(arr1, arr2)
#   products = []
#   arr1.each_index { |index| products << arr1[index] * arr2[index] }
#   p products
# end

#alt w/ #times

# def multiply_list(arr1, arr2)
#   products = []
#   arr1.size.times { |index| products << arr1[index] * arr2[index] }
#   p products
# end

# alt w/ #map

# def multiply_list(arr1, arr2)
#   products = arr1.map.with_index do |number, index| 
#     number * arr2[index]
#   end
#   p products
# end

# alt w/ loop

# def multiply_list(arr1, arr2)
#   products = []
#   index = 0
#   loop do
#     products << arr1[index] * arr2[index]
#     index += 1
#     break if index >= arr1.size
#   end
#   products
# end

# further exploration w/ Array#zip

# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |array| array.inject(:*) }
# end

# alt w/ indices

# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |array| array[0] * array[1] }
# end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]





