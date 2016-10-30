# def balanced?(string)
#   parens = string.chars.select { |char| char =~ /[()]/ }
#   loop do
#     length = parens.length
#     parens.each_with_index do |paren, index|
#       if paren == '(' && parens[index+1] == ')'
#         parens.slice!(index, 2)
#       end
#     end
#     break if parens.length == length
#   end
#   parens.empty?
# end

# alt counting ( and )

# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

# further exploration

PAIRS = [['(', ')'], ['{', '}'], ['[', ']'], ["\"", "\""], ['\'', '\'']]

def balanced?(string)
  PAIRS.each do |pair|
    tally = 0
    string.each_char do |char|
      tally += 1 if char == pair[0]
      tally -= 1 if char == pair[1]
      break if tally < 0
    end
    return false if !tally.zero?
  end
  true
end

p balanced?('{}{}What (is) this?') == true