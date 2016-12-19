class Book
  # attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
# => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.)
# => book = "Snow Crash", by Neil Stephenson.

# further exploration

# Creating objects this way, as opposed to assigning auther and title
# instance variables when the object is instantiated, creates a risk of 
# incomplete objects. For example, each Book object needs both a title and book. 