puts "Enter a number between 0 and 100"
num = gets.chomp.to_i

range = case
  when (num < 0)
    puts "#{num} is a negative number, and outside the required input range." 
  when (num >= 0 && num <= 50)
    puts "#{num} is between 0 and 50."
  when (num >= 51 && num < 100)  
    puts "#{num}is between 51 and 100."  
  else
    puts "#{num} is greater than 100, and outside the required input range."
  end

range