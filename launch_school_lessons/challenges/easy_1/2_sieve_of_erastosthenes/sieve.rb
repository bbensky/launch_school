# class Sieve
#   def initialize(upper_limit)
#     @range = (2..upper_limit)
#     @num_hash = @range.each_with_object({}) do |num, hsh|
#       hsh[num] = true
#     end
#   end

#   def primes
#     @num_hash.each do |num, value| # try w/ reduce?
#       next if value == false
#       multiplier = 2

#       loop do
#         multiple = num * multiplier
#         break if multiple > @num_hash.keys.last
#         @num_hash[multiple] = false
#         multiplier += 1
#       end
#     end

#     @num_hash.select { |k, v| v }.keys
#   end
# end

# alt

class Sieve
  def initialize(max_num)
    @numbers = (2..max_num).to_a
  end

  def primes
    @numbers.each do |num|
      @numbers.reject! { |n| n != num && n % num == 0}
    end

    @numbers
  end
end