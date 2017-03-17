# Group 1

# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# 1. Calling puts on a Proc object displays the Proc object ID

# 2. Calling #class on a Proc object returns the class name.

# 3. Calling a proc (using Proc#call) without passing in an argument will
#    still display a result. If a block argument is expected in a string and there
#    is no argument, the result will not include the block argument.

# 4. If an argument is passed in when Proc#call is invoked, that argument
#    will be assigned to a block variable in the proc.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# 1. Lambdas are instantiated like a Proc, creating a new Lambda object 
#    that's a block of code. Calling #puts on a lambda displays a Proc object, 
#    however they show "(lambda)" in the output. So lambdas are a type of Proc object.

# 2. Lambdas might be able to be initialized with this syntax:
#    lambda = -> (argument) { block }

# 3. Lambdas can be executed like regular Proc objects: lambda.call

# 4. Unlike regular Proc objects, the number of arguments passed into a lambda
#    call must be the same as the number of block arguments.

# 5. There is no such thing as a Lambda class, a Lambda is a type of Proc object.

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# 1. If an argument is not passed into a block through yield, but the block
#    takes an argument, the argument will be ignored if included in a string
#    within the block.

# 2. If yield is included in a method, but no block is provided with a method
#    invocation, the code will return a LocalJumpError.

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# 1. If a block takes multiple arguments, but only one is provided, the block will
#    assign the passed in argument to the first block parameter, and ignore the 
#    second block parameter.

# 2. If an argument is passed to a block, but the block does not have an explicit block 
#    parameter, the argument will not be passed through.


# Final Analysis:

# Lambdas are actually Proc objects with stricter rules on arguments. Procs can be
# called even if the number of arguments passed in to the block is less than the
# number of block parameters. Lambdas require that number to be the same.

# Blocks and procs behave similarly.
