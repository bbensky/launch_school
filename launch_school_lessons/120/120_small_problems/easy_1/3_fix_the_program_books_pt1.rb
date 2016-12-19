# class Book

#   attr_reader :author, :title

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# # => The author of "Snow Crash" is Neil Stephenson.
# puts %(book = #{book}.)
# # => book = "Snow Crash", by Neil Stephenson.

# further exploration

# attr_reader only permits the retrieval of state data, attr_writer
# only permits setting state data, and attr_accessor creates methods for both

# while using #attr_accesor would also provide the desired result,
# it could be dangerous to allow those states to be altered publicly
# if there is no reason to do so

class Book

  def initialize(author, title)
    @author = author
    @title = title
  end

  def title
    @title
  end

  def author
    @author
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
# => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.)
# => book = "Snow Crash", by Neil Stephenson.

# replacing the attr_reader method with getter method definitions
# does not change behavior, but it does restrict altering those methods
# should someone want to do so in the future

