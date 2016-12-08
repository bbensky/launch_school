# class Person
#   attr_accessor :secret
#   def initialize
#     @secret = ''
#   end
# end

# alt w/o initialize

class Person
  attr_accessor :secret
end

# alt w/o attr_accessor

# class Person
#   def secret
#     @secret
#   end

#   def secret=(new_secret)
#     @secret = new_secret
#   end
# end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret