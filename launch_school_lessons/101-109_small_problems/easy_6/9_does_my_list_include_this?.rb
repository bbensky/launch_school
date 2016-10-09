# def include?(array, value)
#   array.each { |element| return true if element == value }
#   false
# end

# alt w/ !! and Array#find_index

# def include?(array, value)
#   !!array.find_index(value)
# end

# alt w/ Array#count

# def include?(array, value)
#   !!(array.count(value) > 0)
# end

# alt w/ Ennumerable#one?

# def include?(array, value)
#   array.one? { |element| element == value }
# end

# alt w/ Array#select

# def include?(array, value)
#   matches = array.select { |element| element == value }
#   matches.empty? ? false : true
# end

# alt w/ Ennumberable#any?

def include?(array, value)
  array.any? { |element| element == value }
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false