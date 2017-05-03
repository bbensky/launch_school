class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a

  @@robot_names = []

  def initialize
    reset
    @@robot_names << @name
  end

  def name
    @name
  end

  def reset
    @name = generate_name
  end

  private

  def generate_name
    new_name = ''

    loop do
      2.times { new_name << LETTERS.sample }
      3.times { new_name << NUMBERS.sample }
      break unless @@robot_names.include?(new_name)
      new_name = ''
    end

    new_name
  end
end
