# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cat #{@name} is #{@age} years old and has #{@color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch
# => My cat Pudding is 7 years old and has black and white fur.
# => My cat Butterscotch is 10 years old and has tan and white fur.

# further exploration

class Pet
  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end
end

class Cat < Pet
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Modifying the Pet class to accept a color parameter would allow
# for the omission of an initialize method in the Cat class, because the Cat
# class would inherit the initialize method from the Pet class. If all Pets had
# colors, this would be a more efficient way to organize code. By modifying Pet,
# other aimals that are descendants of Pet would need to be adjusted to account for the 
# new color instance variable.

