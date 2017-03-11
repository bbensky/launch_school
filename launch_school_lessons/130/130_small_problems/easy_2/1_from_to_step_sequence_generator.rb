# def step(start_val, end_val, step_val)
#   current_val = start_val

#   while current_val <= end_val
#     yield(current_val)
#     current_val += step_val
#   end

#   end_val
# end

# alt

def step(start_val, end_val, increment)
  current_val = start_val
  until current_val > end_val
    yield(current_val)
    current_val += increment
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }