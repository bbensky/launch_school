def all_caps(str)
  if str.length > 10
    str.upcase
  else
    str  
  end  
end

puts all_caps('hello world')
puts all_caps('hi world')