class Transform 
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def uppercase
    self.text.upcase
  end

  def self.lowercase(text)
    text.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
# => ABC
puts Transform.lowercase('XYZ')
# => xyc