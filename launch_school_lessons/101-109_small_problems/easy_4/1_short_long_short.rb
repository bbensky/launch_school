# def short_long_short(str1, str2)
#   shorter = ''
#   longer = ''
#   if str1.length > str2.length
#     shorter = str2
#     longer = str1
#   else
#     shorter = str1
#     longer = str2
#   end 
#   shorter + longer + shorter
# end

# alt

# def short_long_short(str1, str2)
#   if str1.length < str2.length
#     str1 + str2 + str1
#   else
#     str2 + str1 + str2
#   end 
# end

# alt

# def short_long_short(str1, str2)
#   str1.length < str2.length ? (str1 + str2 + str1) : (str2 + str1 + str2)
# end

# def short_long_short(str1, str2)
#   arr = [str1, str2].sort_by { |el| el.length }
#   arr[0] + arr[1] + arr[0]
# end

# alt 

def short_long_short(str1, str2)
  ((str1.length <=> str2.length) < 0) ? (str1 + str2 + str1) : (str2 + str1 + str2)
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"