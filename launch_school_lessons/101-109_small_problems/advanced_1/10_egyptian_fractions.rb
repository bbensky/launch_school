# def egyptian(number)
#   result = []

#   first = number
#   second = Rational(1, number.denominator / number.numerator + 1)

#   loop do
#     difference = first - second
#     if difference < 0
#       second = Rational(1, second.denominator + 1)
#     else
#       result << second
#       first = difference
#       second = Rational(1, second.denominator + 1)
#     end
#     break if difference.zero?
#   end
#   result.map { |value| value.denominator }
# end

# def unegyptian(denominators)
#   egyptian_fractions = denominators.map { |denominator| Rational(1, denominator)}
#   egyptian_fractions.reduce(:+)
# end

# alt LS solution

def egyptian(target_value)
  denominators = []
  unit_denominator = 1
  until target_value == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= target_value
      target_value -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end

  denominators
end

def unegyptian(denominators)
  denominators.inject(Rational(0)) do |accum, denominator|
    accum + Rational(1, denominator)
  end
end

p egyptian(Rational(2, 1))
p egyptian(Rational(137, 60))
p egyptian(Rational(3, 1))

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)