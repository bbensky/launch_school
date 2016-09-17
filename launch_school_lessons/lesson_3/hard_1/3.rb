def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# This will print:
# one is: one
# two is: two
# three is: three


def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
  puts one.object_id
  puts two.object_id
  puts three.object_id
end

one = "one"
puts one.object_id
two = "two"
puts two.object_id
three = "three"
puts three.object_id

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# This will print:
# ones is: one
# two is: two
# three is: three

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# This will print:
# one is: two
# two is: three
# three is: one