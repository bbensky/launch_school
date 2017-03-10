require 'pry'

# LETTERS = ('a'..'z').to_a

# def convert_letter(letter)
#   upcase_letter = letter.upcase == letter ? true : false

#   letter_index = LETTERS.index(letter.downcase)

#   new_letter = if letter_index <= 12
#                  LETTERS[letter_index + 13]
#                else
#                  LETTERS[letter_index - 13]
#                end

#   upcase_letter ? new_letter.upcase : new_letter
# end

# def convert_text(string)
#   result = ''
#   string.each_char do |char|
#     if LETTERS.include?(char.downcase)
#       result << convert_letter(char)
#     else
#       result << char
#     end
#   end
#   p result
# end

# alt LS solution

# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# alt Kristen Wilde solution

def decipher(string)
  string.chars.reduce('') { |result, char| result << rotate13(char) }
end

def rotate13(char)
  return char unless ('a'..'z').include?(char.downcase) 
  key = if char.downcase == char then ('a'..'z').to_a
        else ("A".."Z").to_a
        end
  key.rotate(key.index(char))[13]
end

names = File.read("5_names.txt").split("\n")

names.each { |name| puts decipher(name) }

