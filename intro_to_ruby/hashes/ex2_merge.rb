# merge returns a new hash that combines the hash that the method is called on
# with the hash that's passed as an argument

# Instead of returning a new hash merge! adds the contents of the hash that's
# passed as an argument to the hash that the method is called on, changing that hash.

hash1 = { a: 100, b: 200, c: 300 }
hash2 = { d: 400, e: 400, f: 500 }

puts "Hash1 is #{hash1}"
puts "Hash2 is #{hash2}"

hash3 = hash1.merge(hash2)

puts "Using merge, a new hash, Hash3, is created:"
puts hash3 
puts "and Hash1 is still #{hash1}"

hash1.merge!(hash2)

puts "Using merge!, hash1 becomes #{hash1}"