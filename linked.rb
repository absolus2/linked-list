class LinkedList
  
  attr_accessor :head
  def initialize
    @head = nil
  end

  # append a new element to the list, if there's no head the element becomes the head.
  def append(value)
    if @head 
      tail.next = Node.new(value) 
    else 
      @head = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def tail(node=@head)
    return node if node.next == nil
    node = node.next
    tail(node)
  end

  def size(node=@head,times=1)
    return times  if node.next == nil
    node = node.next
    size(node, times+1)
  end

  def at(index, node=@head, times=0)
    return node if times == index
    node = node.next
    at(index, node, times + 1)
  end
end

class Node

  attr_reader :value
  attr_accessor :next
  
  def initialize(value=nil, link=nil)
    @value = value
    @next = link
  end

  # return the value of the node
  def to_s
    "The value of the node is #{value}"
  end

end

asco = LinkedList.new()

asco.append(22)
asco.append(44)
asco.append(33)
asco.append(11)
asco.append(55)
asco.append(88)
asco.prepend(66)


