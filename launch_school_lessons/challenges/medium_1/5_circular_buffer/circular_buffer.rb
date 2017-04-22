# Buffer data structure:
  # Array of number of arrays of length passed in
    # This prevents nil from being an element value

# Track oldest element
  # Elements are arranged in the array from oldest to newest
  # Objects are written to the first empty element, or oldest element if 
    # array is full
  # Elements are read from the first element onwards. Once an element is read,
    # the array shifts and a new empty element is pushed in 


class BufferEmptyException < StandardError; end
class BufferFullException < StandardError; end

class CircularBuffer
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size, [])
  end

  def read
    raise BufferEmptyException if @buffer[0].empty?
    @buffer.push []
    @buffer.shift
  end

  def write(value)
    idx = @buffer.index([])
    raise BufferFullException if idx.nil?
    @buffer[idx] = value if value
  end

  def write!(value)
    if @buffer.any? { |element| element == [] }
      write(value)
    elsif value
      @buffer.shift
      @buffer << []
      write(value)
    end
  end

  def clear
    @buffer.map! { |element| [] }
  end
end

buffer = CircularBuffer.new(2)
buffer.write '1'
buffer.write '2'
p buffer.read
p buffer.read