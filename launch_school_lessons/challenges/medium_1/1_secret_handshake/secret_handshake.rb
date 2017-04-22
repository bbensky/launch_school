# class SecretHandshake
#   ACTIONS = ['jump', 'close your eyes', 'double blink', 'wink']

#   def initialize(obj)
#     @binary_string = obj.to_i.to_s(2)
#   end

#   def commands
#     result = []

#     -1.downto(-4) do |idx|
#       result << ACTIONS[idx] if @binary_string[idx] == '1'
#     end

#     @binary_string[-5] == '1' ? result.reverse : result
#   end
# end

#  alt Ryan McQuilton solution

class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump', 
             'reverse'].freeze

  def initialize(number)
    @binary = five_digit_binary(number)
  end

  def commands
    actions = ACTIONS.select.with_index do |_, index|
      @binary.reverse[index] == '1'
    end

    actions.last == 'reverse' ? actions.reverse[1..4] : actions 
  end

  private

  def five_digit_binary(number)
    number = '0' if number =~ /[^0-1]/
    number = number.to_i.to_s(2)
    number.rjust(5, '0')[-5..-1]
  end
end

