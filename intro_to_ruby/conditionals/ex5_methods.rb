puts "Enter a number between 0 and 100"
num = gets.chomp.to_i

def case_range(num)
  case
  when num < 0
    puts "#{num} is a negative number, and outside the required input range." 
  when num <= 50
    puts "#{num} is between 0 and 50."
  when num <= 100
    puts "#{num} is between 51 and 100."  
  else
    puts "#{num} is greater than 100, and outside the required input range."
  end
end


def if_range(num)
  if num < 0
    puts "#{num} is a negative number. I said to enter a number between 0 and 100."
  elsif num <= 50
    puts "#{num} is between 0 and 50."    
  elsif num <= 100
    puts "#{num} is between 51 and 100."
  else
    puts "#{num} is greater than 100. I said to enter a number between 0 and 100."    
  end
end

case_range(num)
if_range(num)  