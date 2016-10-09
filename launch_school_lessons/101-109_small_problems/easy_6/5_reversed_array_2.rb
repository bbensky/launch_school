# def reverse(array)
#   array_copy = array.clone
#   left_index = 0
#   right_index = -1

#   while left_index < array_copy.size / 2
#     array_copy[left_index], array_copy[right_index] = array_copy[right_index], array_copy[left_index]
#     left_index += 1
#     right_index -= 1
#   end

#   array_copy
# end

# alt w/o clone

# def reverse(array)
#   reversed_array = []
#   return reversed_array if array == []
#   right_index = -1

#   while right_index.abs <= array.size
#     reversed_array << array[right_index]
#     right_index -= 1
#   end

#   reversed_array
# end

# alt w/ Array#unshift

def reverse(array)
  result_array = []
  array.each { |element| result_array.unshift(element) }
  result_array
end

# alt w/ Array#reverse_each

# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

# alt w/ Integer#upto and Array#mapirb

# def reverse(array)
#   1.upto(array.length).map { |index| array[-index] }
# end

# alt w/ Ennumerable#each_with_object

# def reverse(array)
#   array.each_with_object([]) { |element, object| object.unshift(element) }
# end

# alt w/ Ennumerable#inject

# def reverse(array)
#   array.inject([]) { |new_array, element| new_array.unshift(element) }
# end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1] 