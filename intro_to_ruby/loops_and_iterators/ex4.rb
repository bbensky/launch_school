def countdown(x)
  if x < 0
    return
  else
    puts x
    countdown(x - 1)
  end    
end

puts countdown(0)