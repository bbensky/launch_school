# array = %w(raven finch hawk eagle)

# def drop_first_two(array)
#   yield(array)
# end

# drop_first_two(%w(raven finch hawk eagle)) do |array|
#   p birds_of_prey = array[2..-1]
# end

# alt w/ splat

# drop_first_two(array) do |array|
#   *birds_of_prey = array[2..-1]
#   p birds_of_prey
# end

# alt LS solution

birds = %w(crow finch hawk eagle)

def types(birds)
  yield(birds)
end

types(birds) do |_, _, *birds_of_prey|
  puts "Two birds of prey are the #{birds_of_prey.join(' and ')}."
end

types(birds) do |*not_birds_of_prey, _, _|
  puts "Two birds that are not birds of prey are the " \
       "#{not_birds_of_prey.join(' and ')}."
end

types(birds) do |*args, icon, _|
  puts "I follow the #{icon}."
end