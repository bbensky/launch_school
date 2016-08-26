loop 
  text_entry = nil
  number_of_lines = nil

  loop do
    puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit)'

    text_entry = gets.chomp
    break if text_entry.downcase == 'q'

    number_of_lines = text_entry.to_i
    break if number_of_lines >= 3

    puts ">> That's not enough lines."
  end

  break if text_entry.downcase == 'q'

  while number_of_lines > 0
    puts 'Launch School is the best!'
    number_of_lines -= 1
  end
end

