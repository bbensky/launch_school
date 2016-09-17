def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# rolling_buffer1 appends an element to an array that's being passed in to the method.
# rolling_buffer2 doesn't alter the array that's passed in, but returns a new array object.
# To be used outside the method, that object would have to be assigned to a variable outside of 
# the method.