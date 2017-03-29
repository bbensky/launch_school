# input strings
# output integer

# set Hamming distance to 0

# compare letters by index
  # determine max index
    # find which is shorter
    # set max index as shorter string size - 1
  # compare each letter by iterating through index
    # if letters are different, increment Hamming distance

# max_idx = [first.size, second.size].min - 1

# 0.upto(max_idx) { |idx| distance += 1 if first[idx] != second[idx] }

# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(distance)
#     max_size = [@strand.length, distance.length].min

#     (0...max_size).reduce(0) do |result, idx| 
#       @strand[idx] != distance[idx] ? result + 1 : result
#     end
#   end
# end

# alt sort_by

# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(distance)
#     h_distance = 0
#     min, max = [@strand, distance].sort_by(&:length)

#     min.chars.each_index do |idx|
#       h_distance += 1 unless min[idx] == max[idx]
#     end

#     h_distance
#   end
# end

# alt w/o checking size

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    h_distance = 0

    @strand.chars.each_index do |idx|
      break if distance[idx].nil?
      h_distance += 1 unless @strand[idx] == distance[idx]
    end

    h_distance
  end
end