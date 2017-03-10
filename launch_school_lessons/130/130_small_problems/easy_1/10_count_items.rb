require 'pry'

# def count(collection)
#   true_results = 0

#   collection.each do |item|
#     true_results += 1 if yield(item)
#   end  

#   true_results
# end

# alt w/ reduce

# def count(collection)
#   collection.reduce(0) do |true_results, item|
#     yield(item) ? true_results + 1 : true_results
#   end  
# end

# alt further exp

# def count(collection)
#   true_results = 0
#   for x in collection do
#     true_results += 1 if yield(x)
#   end 
#   true_results
# end

def count(collection)
  collection.select { |item| yield(item) }.count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2