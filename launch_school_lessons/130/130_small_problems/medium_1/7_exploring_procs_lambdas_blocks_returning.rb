# Group 1
# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end

# check_return_with_proc

# 1. If a proc is defined and called within a method, an explicit return in the proc
#    will extend to the method, and will terminate further method code 
#    execution.

# # Group 2
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# 1. If a proc with a return statement is defined outside of a method, but passed 
# into and called in a method, that will throw a LocalJumpError.

# # Group 3
# def check_return_with_lambda
#   my_lambda = lambda { return }
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda

# 1. If a lambda is defined and called within a method, an explicit return in the lambda
#    will not extend to the method, and any additional code will be executed. 

# # Group 4
# my_lambda = lambda { return }
# def check_return_with_lambda(my_lambda)
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda(my_lambda)

# 1. If a lambda with a return statement is defined outside of a method, but passed 
# into and called in a method, that will not stop continued execution of method code.

# # Group 5
def block_method_3
  yield
end

block_method_3 { return }

# 1. If an implicit block is called through a yield in a method, and that block
#    containes a return, a LocalJumpError will be thrown.

# Final Analysis:

# 1. Regular procs an implied blocks that are defined and called within a method
#    and have return statements, will exit the method after the return statements.
#    procs and implied blocks that have returns but are defined outside of method
#    definitions throw errors.

# 2. When lambdas with return statements are called, regardless of whether they
#    are defined inside or outside of the method in which they are called, the
#    return statement will not extend to the method and any further code will be 
#    executed. 

