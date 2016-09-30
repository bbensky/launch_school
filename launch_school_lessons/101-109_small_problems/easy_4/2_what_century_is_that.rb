# def century(number)
#   century = ''
#   if number % 100 == 0 
#     century = (number / 100)
#   else
#     century = ((number / 100) + 1)
#   end

#   if century % 10 == 0 || (11..19).include?(century % 100)
#     century = century.to_s + 'th'
#   elsif century % 10 == 1
#     century = century.to_s + 'st'
#   elsif century % 10 == 2
#     century = century.to_s + 'nd'
#   else
#     century = century.to_s + 'rd'
#   end

# end

# alt

# def century(number)
#   century = ''
#   if number % 100 == 0 
#     century = (number / 100)
#   else
#     century = ((number / 100) + 1)
#   end

#   return century.to_s + 'th' if (11..13).include?(century%100)

#   case century % 10
#   when 1
#     century.to_s + 'st'
#   when 2
#     century.to_s + 'nd'
#   when 3
#     century.to_s + 'rd'
#   else
#     century.to_s + 'th'
#   end
# end

def century(year)
  century = (year.to_f / 100).ceil.to_s
  suffix(century)
end

def suffix(number)
  return number + 'th' if number[-2] == '1'
  case number.chars.last
  when '1' then number + 'st'
  when '2' then number + 'nd'
  when '3' then number + 'rd'
  else        number + 'th'  
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'