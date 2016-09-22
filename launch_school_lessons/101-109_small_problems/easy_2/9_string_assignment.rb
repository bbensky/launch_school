name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# "Alice"
# "Bob"

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# 'BOB'
# 'BOB'

# #upcase! mutates the object that the variable that it is called on points to.
# That change will be reflected in that variable's aliases, so save_name will 
# also reflect the changes in the mutated object.