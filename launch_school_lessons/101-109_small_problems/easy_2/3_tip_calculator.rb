# print 'What is the bill? '
# bill = gets.to_f

# print 'What is the tip percentage? '
# tip_percent = gets.to_f / 100

# tip = (bill * tip_percent).round(2)
# total = (bill + tip).round(2)

# puts "The tip is $#{tip}"
# puts "The total is $#{total}"

# alt w/ money format output

print 'What is the bill? '
bill = gets.to_f

print 'What is the tip percentage? '
tip_percent = gets.to_f / 100

tip = (bill * tip_percent)
total = (bill + tip)

puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f", total)}"