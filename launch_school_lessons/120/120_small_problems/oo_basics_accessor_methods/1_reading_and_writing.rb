# class Person
#   attr_reader :name
#   attr_writer :name
# end

# alt w/ manual implementation

class Person
  def name=(name)
    @name = name
  end

  def name
    @name
  end
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name