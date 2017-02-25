class Person
  attr_reader :name
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    self.name=(full_name)  # doesn't work (name= doesn't get called until the line with bob.name=
                        #  even though it seems like it should be called during
                        #  the instantiation of a Person object)

    # From the tests below, it seems like it's just setting a local variable
    #  called name to the value contained in full_name, rather than actually
    #  running the name= method.
    p "name   => #{name.inspect}"   #=> 'Robert'
    p "name(blob) => #{name().inspect}" #=> nil
    p "@name  => #{@name.inspect}"  #=> nil
           #  contained in name=
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def parse_full_name(full_name)
    @name = full_name
    self.first_name, self.last_name = "#{name} ".split(' ', -1)
  end

end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'