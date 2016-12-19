# class Banner
#   def initialize(message)
#     @message = message
#     @message_length = message.chars.count
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+-#{'-' * @message_length}-+"
#   end

#   def empty_line
#     "| #{' ' * @message_length} |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

#further exploration - option to specify fixed banner width

class Banner
  def initialize(message, width=0)
    @message = message
    @width = width.zero? ? message.size : width
    if !width_ok?(message)
      puts "The width you provided is too narrow."
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def width_ok?(message)
    return true if @width >= (message.size)
    false
  end

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    if @width == @message.size
      "| #{@message} |"
    else
      spacing = @width - @message.size
      front_spacing = spacing / 2
      back_spacing = spacing.even? ? front_spacing : (front_spacing + 1)
      "| #{(' ' * front_spacing) + @message + (' ' * back_spacing)} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner
puts
banner = Banner.new('To boldly go where no one has gone before.', 40)

puts
banner = Banner.new('')
puts banner