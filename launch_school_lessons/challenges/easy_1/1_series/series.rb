# class Series
#   def initialize(numbers)
#     @digits = numbers.split('').map(&:to_i)
#   end

#   def slices(cons)
#     raise ArgumentError, 'number larger than string size' if cons > @digits.size
#     @digits.each_cons(cons).with_object([]) { |group, result| result << group}
#   end
# end

# alt shorter each_cons line

class Series
  def initialize(numbers)
    @digits = numbers.split('').map(&:to_i)
  end

  def slices(cons)
    raise ArgumentError, 'number larger than string size' if cons > @digits.size
    p @digits.each_cons(cons).to_a
  end
end
