array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C') }
puts array2

# Moe
# Larry
# CURLY 
# CHEMP 
# Harpo
# CHICO 
# Groucho
# Zeppo

# While the arrays are different objects, their elements are pointing 
# to the same objects. So mutating an object that both arrays reference 
# will be seen in each array.

# Further exploration: This could be a problem if you want to mutate objects
# in one array but not the other.

# Fix: 
# array1.each { |value| array2 << value.clone }
# Object#clone will duplicate the object, so array2 will not reference the
# same objects as array1.

# More complex fix:
# array1.map! { |value| value.upcase if value.start_with?('C') }
# or (this is a simpler way)