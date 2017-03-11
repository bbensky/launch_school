# def each_cons(array, increment)
#   array.each_with_index do |item, idx|
#     break if idx + (increment - 1) >= array.size
#     if increment == 1
#       yield(item)
#     else
#       arguments = array[idx..(idx + (increment - 1))]
#       yield(arguments)
#     end
#   end
# end

# alt LS solution

# def each_cons(array, n)
#   array.each_index do |index|
#     break if index + n - 1 >= array.size
#     yield(*array[index..(index + n - 1)])
#   end
# end

# alt 

def each_cons(array, n)
  array.each_index do |index|
    break if index + n > array.size
    yield(*array[index...(index + n)])
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
  hash
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
  hash
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}