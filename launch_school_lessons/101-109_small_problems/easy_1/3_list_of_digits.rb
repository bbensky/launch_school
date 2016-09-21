def digit_list(number)
   number_array = number.to_s.split('')
   number_array.map { |number| number.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

#alt

def digit_list_brute_force(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

puts digit_list_brute_force(12345) == [1, 2, 3, 4, 5]
puts digit_list_brute_force(7) == [7]
puts digit_list_brute_force(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list_brute_force(444) == [4, 4, 4]

#alt

def digit_list_shorter(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list_shorter(12345) == [1, 2, 3, 4, 5]
puts digit_list_shorter(7) == [7]
puts digit_list_shorter(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list_shorter(444) == [4, 4, 4]
