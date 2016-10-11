# def staggered_case(text)
#   result = ''
#   need_upper = true
#   text.chars.each do |char|
#     if char =~ /[^a-zA-Z]/
#       result += char
#       next
#     elsif need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper
#   end
#   result 
# end

# alt w/ extra conditional

# def staggered_case(text)
#   result = ''
#   need_upper = true
#   text.chars.each do |char|
#     if char =~ /[a-z]/i
#       if need_upper
#         result += char.upcase
#       else
#         result += char.downcase
#       end
#       need_upper = !need_upper
#     else
#       result += char
#     end
#   end
#   p result 
# end

# further exploration

# def staggered_case(text, only_letters = true)
#   result = ''
#   only_letters == true ? evaluation = /[a-z]/i : evaluation = /./
#   need_upper = true
#   text.chars.each do |char|
#     if char =~ evaluation
#       if need_upper
#         result += char.upcase
#       else
#         result += char.downcase
#       end
#       need_upper = !need_upper
#     else
#       result += char
#     end
#   end
#   p result 
# end

# alt

def staggered_case(text, only_letters=true)
  result = ''
  need_upper = true
  text.each_char do |char|
    if char =~ /[a-z]/i
      result += ( need_upper ? char.upcase : char.downcase )
      need_upper = !need_upper
    else
      result += char
      need_upper = !need_upper if !only_letters
    end
  end
  result 
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', false) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'