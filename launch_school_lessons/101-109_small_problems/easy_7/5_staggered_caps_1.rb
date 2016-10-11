# def staggered_case(text)
#   characters = text.chars
#   characters.each_with_index do |char, index|
#     index.even? ? char.upcase! : char.downcase!
#   end
#   p characters.join
# end

# alt w/ #map and #with_index

# def staggered_case(text)
#   text.chars.map.with_index do |char, index|
#     index.even? ? char.upcase : char.downcase
#   end.join
# end

# alt w/ counter

# def staggered_case(text)
#   index = 0
#   until index >= text.size
#     index.even? ? text[index] = text[index].upcase : text[index] = text[index].downcase
#     index += 1
#     p index
#   end
#   p text
# end

# alt w/ switching boolean

# def staggered_case(text)
#   result = ''
#   need_upper = true
#   text.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper
#   end
#   result
# end

# further exploration

def staggered_case(text, start_upper=true)
  result = ''
  start_upper == true ? need_upper = true : need_upper = false
  text.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  p result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', false) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', false) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', false) == 'iGnOrE 77 tHe 444 nUmBeRs'