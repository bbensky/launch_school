=begin
x = 0
3.times do
  x += 1
end
puts x
=end

y = 0
3.times do
  y += 1
  x = y
end
puts x

#In the first case, x prints 3 to the screen. In the second case, it returns and error.
#The second case returns an error because x is only defined within the scope 
#of the times method or do/end block.