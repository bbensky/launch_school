# def prompt(message)
#   puts "==> #{message}"
# end

# numbers = []

# operations = %w(+ - * / % **)

# %w(first second).each do |ordinal|
#   prompt("Enter the #{ordinal} number:")
#   numbers << gets.chomp.to_f
# end

# operations.each do |operation|
#   prompt("#{numbers[0]} #{operation} #{numbers[1]} = " +
#        "#{numbers.reduce(operation.to_sym)}")
# end

#alt

OPERATIONS = %w(+ - * / % **)

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number:")
first_number = gets.chomp

prompt("Enter the second number:")
second_number = gets.chomp

OPERATIONS.each do |operator|
  result = eval(first_number + operator + second_number)
  prompt("#{first_number} #{operator} #{second_number} = #{result})")
end