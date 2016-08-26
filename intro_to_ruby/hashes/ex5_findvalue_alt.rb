array = { opposites: "attract", flotsam: "jetsam", plots: "thicken" }

puts "What value are you looking for?"
value = gets.chomp

if array.has_value?(value)
  puts "The array does have #{value}."
else
  puts "No! Sorry!"
end