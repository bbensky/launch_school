# class Cat
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# alt w/ attr_writer

# class Cat
#   attr_reader :name
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# alt w/ attr_accessor

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet