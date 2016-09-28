# def oddities(array)
#   results = []
#   array.each_with_index do |element, index|
#     results << element if index.even?
#   end
#   results
# end

# def oddities(array)
#   results = []
#   index = 0
#   while index < array.size
#     results << array[index]
#     index += 2
#   end
#   results
# end

# def oddities(array)
#   array.select.with_index { |_, index| index.even? }
# end

def oddities(array)
  array.select { |element| array.index(element).even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# def eventualities(array)
#   results = []
#   array.each_with_index do |element, index|
#     results << element if index.odd?
#   end
#   results
# end

# p eventualities([2, 3, 4, 5, 6]) == [3, 5]
# p eventualities(['abc', 'def']) == ['def']
# p eventualities([123]) == []
# p eventualities([]) == []
