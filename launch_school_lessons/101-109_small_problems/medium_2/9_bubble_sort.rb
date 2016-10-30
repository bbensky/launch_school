# def bubble_sort!(array)
#   loop do
#     swapped = false
#     index = 0
#     while index < array.size - 1
#       if array[index] > array[index+1]
#         array[index], array[index+1] = array[index+1], array[index]
#         swapped = true
#       end
#       index += 1
#     end
#     break if !swapped
#   end
# end

# alt w/ Integer#upto, next, backwards

# def bubble_sort!(array)
#   iterations = 0
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       iterations += 1
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end
#     break unless swapped
#   end
#   puts iterations
# end

# further exploration

def bubble_sort!(array)
  iterations = 0
  last = 1
  loop do
    swapped = false
    1.upto(array.size - last) do |index|
      iterations += 1
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    last += 1
    break unless swapped
  end
  puts iterations
end


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = [10,9,8,7,6,5,4,3,2,1]
p bubble_sort!(array)
