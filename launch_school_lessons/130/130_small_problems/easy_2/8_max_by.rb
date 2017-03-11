require 'pry'

# def max_by(array)
#   return nil if array.empty?
#   max_item = array.first
#   max_value = yield(array.first)

#   array.each do |item|
#     if yield(item) > max_value
#       max_value = yield(item)
#       max_item = item
#     end
#   end

#   max_item
# end

# def max_by(array)
#   return nil if array.empty?

#   max_item = array.first
#   max_value = yield(array.first)

#   array.each do |item|
#     next if yield(item) <= max_value
#     max_value = yield(item)
#     max_item = item
#   end

#   max_item
# end

# alt LS solution

# def max_by(array)
#   return nil if array.empty?

#   max_item = array.first
#   largest = yield(max_item)

#   array[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max_item = item
#     end
#   end

#   max_item
# end

# alt

def max_by(collection)
  max_val = collection.first
  collection.each { |el| max_val = el if yield(el) > yield(max_val) }
  max_val
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil