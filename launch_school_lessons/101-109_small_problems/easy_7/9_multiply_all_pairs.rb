def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |first_num|
    arr2.each do |second_num|
      products << first_num * second_num
    end
  end
  p products.sort
end

# alt w/ Array#product

def multiply_all_pairs(arr1, arr2)
  p arr1.product(arr2).map { |pair| pair.inject(:*) }.sort
end

# alt w/ two block parameters

def multiply_all_pairs(arr1, arr2)
  p arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]