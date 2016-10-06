# def print_in_box(text)
#   width = text.length + 2
#   puts '+' + ('-'*width) + '+'
#   puts '|' + (' '*width) + '|'
#   puts '| ' + text + ' |'
#   puts '|' + (' '*width) + '|'
#   puts '+' + ('-'*width) + '+'
# end

# alt refactored w/ interpolation

# def print_in_box(text)
#   horizontal_rule = "+#{'-'*(text.length+2)}+"
#   empty_line = "|#{' '*(text.length+2)}|"
#   puts horizontal_rule
#   puts empty_line
#   puts "| #{text} |"
#   puts empty_line
#   puts horizontal_rule
# end

# further exploration

# truncating text so the box is 80 columns or less

# def print_in_box(text)
#   text = text[0, 76]
#   horizontal_rule = "+#{'-'*(text.length+2)}+"
#   empty_line = "|#{' '*(text.length+2)}|"
#   puts horizontal_rule
#   puts empty_line
#   puts "| #{text} |"
#   puts empty_line
#   puts horizontal_rule
# end

# wrapping words

MAX_WIDTH = 80
TEXT_PADDING = 4
EACH_SIDE_PADDING = 2
MAX_TEXT_WIDTH = MAX_WIDTH - TEXT_PADDING

def word_wrapper(text)
  local_text = text
  lines = []
  until local_text.size == 0
    lines << local_text.slice!(0, MAX_TEXT_WIDTH)
  end
  lines
end

def print_in_box(text)
  text.size > MAX_TEXT_WIDTH ? width = MAX_WIDTH : width = text.length + TEXT_PADDING

  horizontal_rule = "+#{'-' * width}+"
  empty_line = "|#{' ' * width}|"
  standard_padding = ' ' * EACH_SIDE_PADDING

  puts horizontal_rule, empty_line

  if width == MAX_WIDTH
    word_wrapper(text).each do |line|
      line = line.lstrip
      right_padding = ' ' * (EACH_SIDE_PADDING + (MAX_TEXT_WIDTH - line.size))
      puts "|#{standard_padding}#{line.lstrip}#{right_padding}|"
    end
  else
    puts "|#{standard_padding}#{text}#{standard_padding}|"
  end

  puts empty_line, horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('To boldly go where no one has gone before. Why see the same thing twice? Or three times? Or four times?')
print_in_box('To boldly go where no one has gone before. Why see the same thing twice? Or three times? Or four times? and extra text and extra text and extra text and extra text and extra text and extra text')


