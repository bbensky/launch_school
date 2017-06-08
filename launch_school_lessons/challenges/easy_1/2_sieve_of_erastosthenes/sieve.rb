class Sieve
  def initialize(upper_limit)
    @range = (2..upper_limit)
    @num_hash = @range.each_with_object({}) do |num, hsh|
      hsh[num] = true
    end
  end

  def primes
    @num_hash.each do |num, value|
      next if value == false
      multiplier = 2

      loop do
        multiple = num * multiplier
        break if multiple > @num_hash.keys.last
        @num_hash[multiple] = false
        multiplier += 1
      end
    end

    @num_hash.select { |_, v| v }.keys
  end
end
