1.upto(99) { |num| puts num if num.even?}

# alt

puts (1..99).to_a.select(&:even?)

# alt

100.times { |num| puts num if num.positive? && (num % 2).zero? }

# alt

value = 2
until value > 99
  puts value
  value += 2
end

# alt

puts (1..99).reject(&:odd)