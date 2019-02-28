require_relative 'node'

class LinkedList

  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    current = @head
    if current.nil?
    @head = Node.new(data)
    else
      (count - 1).times do
      current = current.next_node
      end
      current.next_node = Node.new(data)
    end
  end

  def count
    current = @head
    return 0 if current.nil?
    counter = 1
    until current.next_node.nil?
      current = current.next_node
      counter += 1
    end
    counter
  end

  def to_string(current = @head, length = count)
    return nil if current.nil?
    beat = "#{current.data}"
    (length - 1).times do
      current = current.next_node
      beat.concat(" #{current.data}")
    end
    beat
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      old_head = @head
      @head = Node.new(data)
      @head.next_node = old_head
    end
  end

  def insert(position, data)
    if @head.nil?
      @head = Node.new(data)
    elsif position >= count
      append(data)
    else
      current = @head
      (position - 1).times do
        current = current.next_node
      end
      new_node = Node.new(data)
      new_node.next_node = current.next_node
      current.next_node = new_node
    end
  end

  def find(position, length)
    current = @head
    position.times do
      current = current.next_node
    end
    to_string(current, length)
  end

  def includes?(data, current = @head)
    begin
      return true if current.data == data
      current = current.next_node
      includes?(data, current)
    rescue NoMethodError
      false
    end
  end

  def pop
    return nil if @head.nil?
    if @head.next_node.nil?
      data1 = @head.data
      @head = nil
      data1
    else
    current = @head
    (count - 2).times do
      current = current.next_node
    end
    data = current.next_node.data
    current.next_node = nil
    data
    end
  end
    # we have to do this beacause the method returns the last line of code.
    # until current.next_node.next_node.nil? #(we can do this way too on line no 95.)
end
