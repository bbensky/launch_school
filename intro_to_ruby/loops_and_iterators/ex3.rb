pet_names = ["Scully", "Phoebe", "Rufus"]

pet_names.each_with_index do |item, index|
  puts "#{index + 1}. #{item}"
end