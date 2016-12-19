# class Vehicle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Car < Vehicle
#   def wheels
#     4
#   end
# end

# class Motorcycle < Vehicle
#   def wheels
#     2
#   end
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end

#   def wheels
#     6
#   end
# end

# car = Car.new('Chevy', 'Nova')
# puts car
# puts car.wheels
# motorcycle = Motorcycle.new('Honda', 'Super Cub')
# puts motorcycle
# puts motorcycle.wheels
# truck = Truck.new('Ford', 'Ranger', 1700)
# puts truck
# puts truck.wheels

# further exploration

# It might make sense to define a wheels method in Vehicle, provided all subclasses would have
# wheels (so there aren't Boats, Skidoos, etc.) The code may need to be restructured, with a class
# variable or constant created to reflect the specifc wheel value of each subclass.

class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model, number_of_wheels)
    @make = make
    @model = model
    @wheels = number_of_wheels
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def initialize(make, model)
    number_of_wheels = 4
    super(make, model, number_of_wheels)
  end
end

class Motorcycle < Vehicle
  def initialize(make, model)
    number_of_wheels = 2
    super(make, model, number_of_wheels)
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    number_of_wheels = 6
    super(make, model, number_of_wheels)
    @payload = payload
  end
end

car = Car.new('Chevy', 'Nova')
puts car
puts car.wheels
motorcycle = Motorcycle.new('Honda', 'Super Cub')
puts motorcycle
puts motorcycle.wheels
truck = Truck.new('Ford', 'Ranger', 1700)
puts truck
puts truck.wheels


