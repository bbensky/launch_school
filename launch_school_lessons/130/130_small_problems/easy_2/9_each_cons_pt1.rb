# def each_cons(array)
#   current_index = 0

#   until current_index >= array.size - 1
#     yield(array[current_index], array[current_index+1])
#     current_index += 1
#   end

#   nil
# end

# alt LS solution

# def each_cons(array)
#   array.each_with_index do |item, idx|
#     break if idx + 1 >= array.size
#     yield(item, array[idx + 1])
#   end
# end

# alt

def each_cons(array)
  array[0..-2].each_with_index do |item, idx|
    yield(item, array[idx + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
  p hash
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}