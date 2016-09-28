# def palindromic_number?(number)
#   number.to_s == number.to_s.reverse
# end

#alt

def palindromic_number?(number)
  index = -1
  rev_array = Array.new("#{number}".length)
  "#{number}".chars.each do |char|
    rev_array[index] = char.to_i
    index -= 1
  end
  number == rev_array.join.to_i
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(0005) == false

#Further Exploration

#This method won't work when the number begins with one or more 0s.
#I'm not sure if there's a fix for this.


