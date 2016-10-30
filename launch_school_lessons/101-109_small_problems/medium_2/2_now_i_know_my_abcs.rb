LETTER_PAIRS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
                 'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
                 'V' => 'I', 'L' => 'Y', 'Z' => 'M' }.freeze

def block_word?(word)
  word_up = word.upcase
  LETTER_PAIRS.each do |a, b|
    return false if word_up.include?(a) && word_up.include?(b)
    return false if word_up.count(a) >=2 || word_up.count(b) >= 2
  end
  true
end

# alt w/ array

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('BBA') == false