arr1 = [1, 2, 3, 4, 5]

arr2 = Array.new

arr1.each do |x|
  arr2.push(x+2)
end

p arr1
p arr2



