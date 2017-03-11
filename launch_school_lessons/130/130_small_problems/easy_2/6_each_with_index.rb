def each_with_index(array)
  idx = 0

  array.each do |item|
    yield(item, idx)
    idx += 1
  end
end

# alt

# def each_with_index(array)
#   (0...array.size).each do |idx|
#     yield(array[idx], idx)
#   end

#   array
# end

# alt

# def each_with_index(array)
#   array.each_with_object([]).with_index do |(item, result), idx|
#     yield(item, idx)
#     result << item
#   end
# end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]