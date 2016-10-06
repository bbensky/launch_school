# def xor?(arg1, arg2)
#   array = arg1, arg2
#   trues = 0
#   array.each do |value|
#     trues += 1 if value == true
#   end
#   true if trues == 1
# end

# alt

def xor?(boolean1, boolean2)
  boolean1 != boolean2
end

# alt

# def xor?(arg1, arg2)
#   xor_table = [arg1, arg2]
#   xor_table.count(true) ? true : false
# end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# Further Exploration:
# xor doesn't perform short circuit evaluation of its operand.
# It must know the value of both expressions to determine if there
# is only one true value.

