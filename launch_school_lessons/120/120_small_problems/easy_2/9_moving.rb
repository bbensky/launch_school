# class Mammal
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def walk
#     puts "#{name} #{gait} forward"
#   end
# end

# class Person < Mammal
#   private

#   def gait
#     "strolls"
#   end
# end


# class Cat < Mammal
#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah < Mammal
#   private

#   def gait
#     "runs"
#   end
# end

# alt w/ module 

# module Walkable
#   def walk
#     puts "#{name} #{gait} forward"
#   end
# end

# class Person
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

#alt parent class + module

module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class LandMammal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Person < LandMammal
  include Walkable

  private

  def gait
    "strolls"
  end
end

class Cat < LandMammal
  include Walkable

  private

  def gait
    "saunters"
  end
end

class Cheetah < LandMammal
  include Walkable

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
