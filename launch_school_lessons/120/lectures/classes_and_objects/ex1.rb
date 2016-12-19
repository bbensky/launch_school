# class Person

#   attr_accessor :name

#   def initialize name
#     @name = name
#   end
# end

# alt

class Person

  def initialize name
    @name = name
  end

  def name=(name)
    @name = name
  end

  def name
    p @name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'