stop_var = ""

while stop_var != "STOP"
  puts "What's up?"
  reply = gets.chomp
  puts "Want to go again?"
  stop_var = gets.chomp
end