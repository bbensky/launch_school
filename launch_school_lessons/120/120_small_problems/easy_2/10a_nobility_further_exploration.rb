# further exploration w/ inheritance

module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name}"
  end  
end

class Person < Animal
  include Walkable

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  include Walkable

  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end
end

class Cat < Animal
  include Walkable
  
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
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

byron = Noble.new("Byron", "Lord")
p byron.name
# => "Byron"
p byron.title
# => "Lord"
byron.walk
# => "Lord Byron struts forward"