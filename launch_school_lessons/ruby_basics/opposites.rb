def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

first_int = nil
second_int = nil

loop do

  loop do
    puts ">> Please enter a positive or negative integer."
    first_int = gets.chomp
    if first_int == '0'
      puts ">> Invalid input. Only non-zero integers are allowed."
    else
      break if valid_number?(first_int)
    end
  end

  loop do
    puts ">> Please enter a positive or negative integer."
    second_int = gets.chomp
    if second_int == '0'
      puts ">> Invalid input. Only non-zero integers are allowed."
    else
      break if valid_number?(second_int)
      puts ">> Please enter a positive or negative integer:"
    end
  end

  first_int = first_int.to_i
  second_int = second_int.to_i

  if (first_int.negative? && second_int.negative?) || (first_int.positive? && second_int.positive?)
    puts ">> Sorry. One integer must be positive, one must be negative."
    puts ">> Please start over."
    puts ""
  else 
    break
  end

end

result = first_int + second_int

puts "#{first_int} + #{second_int} = #{result}"