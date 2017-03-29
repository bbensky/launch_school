# input: number
# output: string

# Step 1 Find Factors
  # Build a range up to 1/2 of the number
  # if the remainder of number and the range number is 0, add number
  # to factor list. 

# Step 2 Determine Perfect/Abundant/Deficient
  # compare sum of factors to number

class PerfectNumber
  def self.classify(number)
    raise RuntimeError, 'number too small' if number <= 0

    factors = determine_factors(number)

    sum = factors.inject(&:+)

    # case sum <=> number
    # when -1 then 'deficient'
    # when 0  then 'perfect'
    # when 1  then 'abundant'
    # end

    # alt 
    ['perfect', 'deficient', 'abundant'][number <=> sum]
  end

  private

  def self.determine_factors(number)
    (1..number/2).select { |num| (number % num).zero? }
  end
end

p PerfectNumber.classify(7)