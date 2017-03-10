# def one?(array)
#   true_count = 0

#   array.each do |item|
#     true_count += 1 if yield(item)
#     return false if true_count > 1
#   end

#   true_count == 1 ? true : false
#  # or just true_count == 1
# end

# alt LS solution

def one?(collection)
  seen_one = false
  collection.each do |item|
    next unless yield(item)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false