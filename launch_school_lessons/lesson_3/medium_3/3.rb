def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# This will display:
# My string looks like this now: pumpkins
# My array looks like this now: ["pumkpins", "rutabaga"]

# a_string_param is reassigned to a new object in tricky_method,
# so it doesn't alter the value that was passed in as an argument 
# (what my_string pointed to). The << method called on an_array_param
# mutated the object that it was pointing to, still the same object
# that my_array was pointing to.