# def integer?(command)
#   command == command.to_i.to_s
# end

# def minilang(commands)
#   register = 0
#   stack = []

#   command_list = commands.split

#   command_list.each do |command|
#     case 
#     when integer?(command)
#       register = command.to_i
#     when command == 'PUSH'
#       stack.push(register)
#     when command == 'ADD'
#       register += stack.pop
#     when command == 'SUB'
#       register -= stack.pop
#     when command == 'MULT'
#       register *= stack.pop
#     when command == 'DIV'
#       register = register / stack.pop
#     when command == 'MOD'
#       register = register % stack.pop 
#     when command == 'POP'
#       register = stack.pop
#     when command == 'PRINT'
#       p register
#     end

#   end

# end

# alt w/ shorter case statement

# def integer?(command)
#   command == command.to_i.to_s
# end

# def minilang(commands)
#   register = 0
#   stack = []

#   command_list = commands.split

#   command_list.each do |command|
#     if integer?(command)
#       register = command.to_i
#       next
#     end

#     case command
#     when 'PUSH'
#       stack.push(register)
#     when 'ADD'
#       register += stack.pop
#     when 'SUB'
#       register -= stack.pop
#     when 'MULT'
#       register *= stack.pop
#     when 'DIV'
#       register /= stack.pop
#     when 'MOD'
#       register %= stack.pop 
#     when 'POP'
#       register = stack.pop
#     when 'PRINT'
#       p register
#     end
#   end

# end

# alt w/ integer in case statement

# def minilang(commands)
#   register = 0
#   stack = []

#   commands.split.each do |command|

#     case command
#     when 'PUSH'  then stack.push(register)
#     when 'ADD'   then register += stack.pop
#     when 'SUB'   then register -= stack.pop
#     when 'MULT'  then register *= stack.pop
#     when 'DIV'   then register /= stack.pop
#     when 'MOD'   then register %= stack.pop 
#     when 'POP'   then register = stack.pop
#     when 'PRINT' then puts register
#     else              register = command.to_i
#     end
#   end

# end

# minilang('PRINT')
# # 0
# puts
# minilang('5 PUSH 3 MULT PRINT')
# # 15
# puts
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
# puts
# minilang('5 PUSH POP PRINT')
# # 5
# puts
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
# puts
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
# puts
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
# puts
# minilang('-3 PUSH 5 SUB PRINT')
# # 8
# puts
# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# further exploration

def integer?(command)
  command == command.to_i.to_s
end

def minilang(commands)
  register = 0
  stack = []

  commands.split.each do |command|
    case 
    when integer?(command)
      register = command.to_i
    when command == 'PUSH'
      stack.push(register)
    when command == 'ADD'
      stack.empty? ? (return "Empty Stack.") : register += stack.pop
    when command == 'SUB'
      stack.empty? ? (return "Empty Stack.") : register -= stack.pop
    when command == 'MULT'
      stack.empty? ? (return "Empty Stack.") : register *= stack.pop
    when command == 'DIV'
      stack.empty? ? (return "Empty Stack.") : register = register / stack.pop
    when command == 'MOD'
      stack.empty? ? (return "Empty Stack.") : register = register % stack.pop 
    when command == 'POP'
      stack.empty? ? (return "Empty Stack.") : register = stack.pop
    when command == 'PRINT'
      p register
    else 
      return "There are invalid tokens in the program."
    end
  end
  nil
end

p minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
p minilang('3 PUSH 5 HELLO')

# 