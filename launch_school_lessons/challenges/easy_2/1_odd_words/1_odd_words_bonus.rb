require 'pry'
# break it down:

# input/output text
  # index is important  

# should text be reversed?
  # have a true/false variable

# print what is read while the t/f variable is false

# if a word should be reversed
  # find the index for the last letter of the word

LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

def is_a_letter?(char)
  LETTERS.include?(char)
end

def odd_words(string)
  reverse_index = nil
  reverse_word = false

  string.each_char.with_index do |char, idx|
    if is_a_letter?(char)

      if reverse_word

        if string[idx - 1] == ' '
          reverse_index = string.index(' ', idx) - 1
          print string[reverse_index]
          reverse_index -= 1
        elsif string[idx + 1] == ' '
          print string[reverse_index]
        else
          print string[reverse_index]
          reverse_index -= 1
        end

      else
        print char
      end

    elsif [' ', '.'].include?(string[idx+1])
      next
    else
      print char
      reverse_word = !reverse_word
    end
  end
  puts
end

odd_words('whats the matter with kansas.')