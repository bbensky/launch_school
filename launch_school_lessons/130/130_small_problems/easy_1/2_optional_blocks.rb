# def compute
#   if block_given?
#     yield
#   else
#     'Does not compute.'
#   end
# end

# alt LS solution

# def compute
#   return 'Does not compute.' unless block_given?
#   yield
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further exploration

def compute(value)
  return 'Does not compute.' unless block_given?
  yield(value)
end

p compute(5) { |num| num + 5 } == 10
p compute('Hi') { |string| string } == 'Hi'
# p compute('no block')