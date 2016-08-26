h = {a:1, b:2, c:3, d:4}

# 1. Get the value of key `:b`.

h[:b]

# 2. Add to this hash the key:value pair `{e:5}`

h[:e] = 5

# 3. Remove all key:value pairs whose value is less than 3.5

h.each do |key,value| 
  if value < 3.5
    h.delete(key)
  end
end

# 3. alt:

h.each {|key,value| h.delete(key) if value < 3.5 }

# 3 alt w/ delete_if

h.delete_if { |key,value| value < 3.5 }
