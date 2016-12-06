class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

# Cat.generic_greeting

# further exploration

kitty = Cat.new
kitty.class.generic_greeting

# This doesn't return an error because #class returns the class, so 
# #generic_greeting is being called on the class itself.