# 
# def running_total(array)
#   total_array = []
#   running_total = 0
  
#   array.length.times do |index|
#     running_total += array[index]
#     total_array << running_total
#   end

#   total_array
# end

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# further exploration

# def running_total(array)
#   sum = 0
#   array.each_with_object([]) do |value, sum_array|
#     sum_array << sum += value
#   end
# end

def running_total(array)
  total_array = []
    array.each_with_index do |value, index|
      total_array << array[0,index+1].inject(:+)
    end
  total_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []