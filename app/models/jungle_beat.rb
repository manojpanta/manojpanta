require_relative 'linked_list'

class JungleBeat

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    data = data.split
    count = 0
    until count == data.length
      @list.append(data[count])
      count += 1
    end
  end

  def count
    @list.count
  end

  def play
    if list.head != nil
      current = list.head
      beats = "#{current.data}"
      until current.next_node.nil?
        current = current.next_node
        beats << current.data
      end
      `say -r 100 #{beats}`
    else
      
    end

  end
end
