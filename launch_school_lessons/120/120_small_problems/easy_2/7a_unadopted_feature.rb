class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet 
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    pets.each { |pet| puts pet}
  end
end

class Shelter
  attr_reader :name

  def initialize(name)
    @name = name
    @owners = {}
    @unadopted_pets = []
  end

  def intake_pet(pet)
    @unadopted_pets << pet
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @unadopted_pets.delete(pet)
    @owners[owner.name] ||= owner
  end

  def number_of_unadopted_pets
    @unadopted_pets.size
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    @unadopted_pets.each do |pet|
      puts pet
    end
    puts
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new("The Animal Shelter")
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions

shelter.intake_pet(asta)
shelter.intake_pet(laddie)
shelter.intake_pet(fluffy)
shelter.intake_pet(kat)
shelter.intake_pet(ben)
shelter.intake_pet(chatterbox)
shelter.intake_pet(bluebell)
shelter.print_unadopted_pets

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{shelter.name} has #{shelter.number_of_unadopted_pets} unadopted pets."

shelter.adopt(phanson, asta)
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
shelter.print_adoptions
puts "#{shelter.name} has #{shelter.number_of_unadopted_pets} unadopted pets."