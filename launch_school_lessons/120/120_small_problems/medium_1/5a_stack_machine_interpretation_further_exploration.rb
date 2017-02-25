require 'set'
require 'pry'

class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
    @stack = []
    @register = 0
  end

  def eval(opt_params = nil)
    this_program = opt_params ? format(@program, opt_params) : @program
    this_program.split.each { |token| eval_token(token) }
  rescue MinilangRuntimeError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif
      token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push 
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, 'Empty stack!' if @stack.empty?
    @register = @stack.pop
  end

  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end

# CENTIGRADE_TO_FAHRENHEIT ='5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # 32
# minilang.eval(degrees_c: -40)
# # -40

# FAHRENHEIT_TO_CENTIGRADE = '9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT'
# minilang = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
# minilang.eval(degrees_f: 212)
# # 100
# minilang.eval(degrees_f: 32)
# # 0
# minilang.eval(degrees_f: -40)
# # -40

# MPH_TO_KPH = '3 PUSH 5 PUSH %<mph>d MULT DIV PRINT'
# minilang = Minilang.new(MPH_TO_KPH)
# minilang.eval(mph: 3)

RECTANGLE_AREA = '%<side1>d PUSH %<side2>d MULT PRINT'
minilang = Minilang.new(RECTANGLE_AREA)
minilang.eval(side1: 5, side2: 3)
