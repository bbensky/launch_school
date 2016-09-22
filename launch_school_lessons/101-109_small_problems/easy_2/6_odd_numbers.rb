(1..99).each do |number|
  puts number if number.odd?
end

#alt

number = 1
until number > 99
  puts number
  number += 2
end

#alt

number = 1
loop do
  puts number
  number += 2
  break if number > 99
end

#alt

number = 1
while number <= 99
  puts number
  number += 2
end

#alt

(1..99).each do |number|
  puts number if number % 2 == 1
end

#alt

1.upto(99) do |number|
  puts number if number % 2 == 1
end

#alt

puts (1...100).to_a.select { |value| value.odd? }

#alt

puts (1..99).to_a.select(&:odd?)

#alt

100.times { |num| puts num if num.odd? }

#

(1..99).step(2) { |num| puts num }