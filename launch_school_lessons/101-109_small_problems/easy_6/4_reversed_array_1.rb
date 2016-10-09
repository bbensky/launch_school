# def reverse!(list)
#   list_copy = list.clone
#   index = 0
#   reverse_index = -1
#   until index >= list.length
#     list[index] = list_copy[reverse_index]
#     index += 1
#     reverse_index -= 1
#   end
#   list
# end

# alt ls version

# def reverse!(array)
#   left_index = 0
#   right_index = -1

#   while left_index < array.size / 2
#     array[left_index], array[right_index] = array[right_index], array[left_index]
#     left_index += 1
#     right_index -= 1
#   end

#   array
# end

# w/ Array#insert

def reverse!(array)
  array.each_index do |index|
    array.insert(index, array.pop)
  end
  array
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []