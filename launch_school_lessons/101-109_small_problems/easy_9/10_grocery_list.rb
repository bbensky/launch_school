# def buy_fruit(list)
#   result = []
#   list.each do |fruit|
#     fruit[1].times { result << fruit[0] }
#   end
#   p result
# end

# alt w/o iterator

# def buy_fruit(list)
#   result = []
#   until list.empty?
#     list[0][1].times { result << list[0][0] }
#     list.shift
#   end
#   p result
# end

# alt reverse 

# def buy_fruit(list)
#   result = []
#   until list.empty?
#     list[-1][1].times { result.unshift(list[-1][0]) }
#     list.pop
#   end
#   p result
# end

# alt shorter

# def buy_fruit(list)
#   result = []
#   list.each do |fruit|
#     result << [fruit[0]] * fruit[1]
#   end
#   p result.flatten
# end

# alt shorter w/ map

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]