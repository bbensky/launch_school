# lights = {}

# 1.upto(1000) { |num| lights[num] = 'off' }

# 1.upto(1000) do |num|
#   lights.each do |light, status|
#     if light % num == 0 
#       status == 'on' ? status = 'off' : status = 'on'
#       lights[light] = status
#     end
#   end
# end

# lights_on = lights.values.count('on')

# puts "There are #{lights_on} lights on and #{1000-lights_on} lights off."

# further exploration

# 1. Do you notice the pattern in our answer? Every light that is on is a perfect square. Why is that?

# I don't know if there are cases where this applies to non-perfect square numbers, but all perfect-square numbers
# have an odd number of divisors that return a remainder of zero. That way they're guaranteed to have a light that's
#  on at the end of the sequence.

# 2. Array instead of Hash

# lights = []
# 1.upto(1000) { |num| lights << num }

# lights_on = []

# 1.upto(1000) do |num|
#   lights.each do |light|
#     if light % num == 0
#       lights_on.include?(light) ? lights_on.delete(light) : lights_on << light
#     end
#   end
# end

# p lights_on.count

# 3. Output lights that are off and on.

def light_status(lights, status)
  lights_with_status = lights.keys.select { |light| lights[light] == status}
  lights_with_status[-1] = "and #{lights_with_status[-1]}"
  lights_with_status.join(', ')
end

lights = {}

1.upto(1000) { |num| lights[num] = 'off' }

1.upto(1000) do |num|
  lights.each do |light, status|
    if light % num == 0 
      status == 'on' ? status = 'off' : status = 'on'
      lights[light] = status
    end
  end
end

lights_on = light_status(lights, 'on')
lights_off = light_status(lights, 'off')

puts "#{lights_off} are now off."
puts "#{lights_on} are now on."

