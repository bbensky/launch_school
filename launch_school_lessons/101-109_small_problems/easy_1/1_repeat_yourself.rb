def repeat_string(string, number_of_times)
  number_of_times.times do
    puts string
  end
end

repeat_string('hello', 3)

#alt

def repeat_until(text, number)
  number_of_lines = 0
  until number_of_lines == 3
    puts  text
    number_of_lines += 1
  end
end

repeat_until('Hello', 3)

#alt2

def repeat_break(text, number)
  number_of_lines = 0
  loop do
    puts text
    number_of_lines += 1
    break if number_of_lines == 3
  end
end

repeat_break('Hello', 3)

#alt3

def repeat_newline(text, number)
  puts text.concat("\n") * 3
end

repeat_newline('Hello', 3)

#alt4

def repeat_upto(text, number)
  1.upto(number) { puts text}
end

repeat_upto('Hello', 3)