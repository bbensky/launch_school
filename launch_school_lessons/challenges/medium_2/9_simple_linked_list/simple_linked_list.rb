# Write a simple linked list implementation that uses Elements and a List.

# The linked list is a fundamental data structure in computer science, often
# used in the implementation of other data structures.

# The simplest kind of linked list is a singly linked list. Each element in the
# list contains data and a "next" field pointing to the next element in the list
# of elements. This variant of linked lists is often used to represent sequences
# or push-down stacks (also called a LIFO stack; Last In, First Out).

# Lets create a singly linked list to contain the range (1..10), and provide
# functions to reverse a linked list and convert to and from arrays.

# Classes:
  # Element
    # Instance variables:
      # Value
      # Next item (default initialization = nil)
    # Methods
      # datum
        # returns value
      # tail
        # returns true or false
          # is next item nil?
      # next
        # getter method for next

# SimpleLinkedList
  # instance varialbles
    # size
    # head element
  # Methods
    # size
      # size getter method
    # empty
      # size == 0
    # peek
      # head element
    # head 
      # head element getter method
    # push
      # initializes a new Element instance
      # new element becomes the head element
      # current head element becomes the next item for the new head element
    # pop
      # head is the value for next of the current head
    # from_a
      # elements are pushed into the list in reverse order 
    # to_a
      # until next is nil, push head datum to array, current head next becomes
      # head

require 'pry'

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
  end

  def empty?
    @size.zero?
  end

  def push(datum)
    new_element = Element.new(datum, @head)
    @head = new_element
    @size += 1
  end

  def pop
    return_datum = @head.datum
    @head = @head.next
    @size -= 1
    return_datum
  end

  def peek
    self.empty? ? nil : @head.datum
  end

  def to_a
    result = []
    result << pop until empty?
    result
  end

  def reverse
    data = to_a.reverse
    list = SimpleLinkedList.from_a(data)
  end

  def self.from_a(array)
    list = new
    array.reverse.each { |datum| list.push(datum) } if array
    list
  end
end

