def input_numbers(ordinal_index)
  ordinals = %w(1st 2nd 3rd 4th 5th last)
  puts "==> Enter the #{ordinals[ordinal_index]} number:"
end

numbers = []

6.times do |ordinal_index|
  input_numbers(ordinal_index)
  numbers << gets.chomp.to_i
end

puts last_number = numbers.pop

if numbers.include?(last_number)
  puts "The number #{last_number} appears in " +
       "#{numbers}."
else
  puts "The number #{last_number} does not appear in " +
       "#{numbers}."
end

# alt

numbers = []

%w(1st 2nd 3rd 4th 5th last).each do |ordinal|
  puts "==> Enter the #{ordinal} number:"
  numbers << gets.chomp.to_i
end

last_number = numbers.pop

appears_or_not = numbers.include?(last_number) ? "appears" : "does not appear"

puts "The number #{last_number} #{appears_or_not} in #{numbers}."