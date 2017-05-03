# change data structure to 3 element array -> left, number, right

require 'pry'

class Bst
  def initialize(number)
    @tree = [nil, number, nil]
    @all_values = []
  end

  def data
    @tree[1]
  end

  def insert(number)
    if number <= @tree[1]
      if @tree[0].nil?
        @tree[0] = Bst.new(number)
      else
        @tree[0].insert(number)
      end
    else
      if @tree[2].nil?
        @tree[2] = Bst.new(number)
      else
        @tree[2].insert(number)
      end
    end
  end

  def left
    @tree[0]
  end

  def right
    @tree[2]
  end

  def each
    result = get_all_data.flatten
    if block_given?
      result.each { |value| yield(value) }
    else
      result.each
    end
  end

  def get_all_data
    result = []
    @tree.each do |node|
      if node.class == Bst
        result << node.get_all_data
      elsif !node.nil?
        result << node
      end
    end
    result
  end
end

# class Bst
#   def initialize(number)
#     @tree = [number, [nil, nil]]
#   end

#   def data
#     @tree[0]
#   end

#   def insert(number)
#     if number <= @tree[0]
#       if @tree[1][0].nil?
#         @tree[1][0] = Bst.new(number)
#       else
#         @tree[1][0].insert(number)
#       end
#     else
#       if @tree[1][1].nil?
#         @tree[1][1] = Bst.new(number)
#       else
#         @tree[1][1].insert(number)
#       end
#     end
#   end



#   def left
#     @tree[1][0]
#   end

#   def right
#     @tree[1][1]
#   end
# end