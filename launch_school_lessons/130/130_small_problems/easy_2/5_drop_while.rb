require 'pry'

# def drop_while(collection)
#   result = []
#   push_to_result = false

#   collection.each do |item|
#     push_to_result = true if !yield(item)

#     result << item if push_to_result
#   end

#   result
# end

#alt

# def drop_while(collection)
#   result = []
#   push_to_result = false

#   collection.each do |item|
#     if push_to_result
#       result << item
#     else
#       push_to_result = true if !yield(item)
#       result << item if push_to_result
#     end
#   end

#   result
# end

# alt each_with_object

# def drop_while(collection)
#   push_to_result = false

#   collection.each_with_object([]) do |item, result|
#     push_to_result = true if !yield(item)
#     result << item if push_to_result
#   end
# end

# alt find starting index to push

# def drop_while(collection)
#   start_idx = nil

#   collection.each_with_index do |item, idx|
#     if !yield(item)
#       start_idx = idx
#       break
#     end
#   end

#   return [] if start_idx.nil?
#   collection[start_idx..-1]
# end

# alt LS solution

# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end

#   array[index..-1]
# end

# alt 1 line

def drop_while(array)
  array.each_with_object([]).with_index do |(item, result), idx| 
    return array[idx..-1] if !yield(item)
  end
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
