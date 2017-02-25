class CircularQueue
  attr_reader = :enqueue_index

  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @element_seniority = Array.new
    @enqueue_index = nil
  end

  def enqueue(object)
   if @element_seniority.size == @buffer.size
     dequeue
   elsif @element_seniority.empty? || (@element_seniority.last[1] == @buffer.size - 1)
     @enqueue_index = 0
   else
     @enqueue_index = @element_seniority.last[1] + 1
   end

    index = @enqueue_index.clone
    @buffer[index] = object

    @element_seniority << [object, index]
  end

  def dequeue
    return nil if @element_seniority.empty?
    index = @element_seniority.shift[1]

    dequeue_value = @buffer[index]
    @enqueue_index = index

    @buffer[index] = nil
    dequeue_value
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil