# def divisors(dividend)
#   result = []

#   1.upto(dividend) do |num|
#     result << num if dividend % num == 0
#   end

#   result
# end

# alt faster

# def divisors(num)
#   1.upto(num/2).select { |n| num % n == 0 } << num
# end

# alt even faster

def divisors(num)
  result = []
  (1..Math.sqrt(num)).each do |factor|
    if num % factor == 0
      result << factor
      result << num / factor unless (num == factor**2)
    end
  end
  result.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]

start = Time.new
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
finish = Time.new

puts finish - start