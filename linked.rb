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

  # append a new element at the beginning of the list
  def prepend(value)
    @head = Node.new(value, @head)
  end

  # return the last element of the list
  def tail(node=@head)
    return node if node.next == nil
    tail(node = node.next)
  end

  # return the size of the list
  def size(node=@head,times=1)
    return times  if node.next == nil
    size(node = node.next, times+1)
  end

  # return the list at index
  def at(index, node=@head, times=0)
    return node if times == index
    at(index, node = node.next, times + 1)
  end

  # return true or false ir the value is in the list
  def contains?(value, node=@head)
    if node.value == value
      return true 
    elsif node.value != value && node.next == nil
      return false
    end
    contains?(value, node = node.next)
  end

  # return the index of an element if is it in the array
  def find(value, node=@head, times=0)
    return times if node.value == value
    find(value, node = node.next, times+1)
  end

  # remove the last element in the list
  def pop(prev=nil, curr=@head)
    return prev.next = nil if curr.next == nil
    pop(prev = curr, curr = curr.next)
  end

  # return a string with every value in the list
  def to_s(node=@head, array=[])
    return array.push("nil").join("=>") if node == nil
    array.push("(#{node.value})")
    to_s(node.next, array)
  end

  # insert elemenet at index
  def insert_at(value, index, prev=nil, curr=@head,times=0)
    return prepend(value) if index == 0
    return prev.next = Node.new(value, curr) if index == times
    insert_at(value, index, prev = curr, curr = curr.next, times+1)
  end

  # remove element at index
  def remove_at(index, prev=nil, curr=@head, times=0)
    return @head = @head.next if index == 0
    return prev.next = curr.next if index == times
    remove_at(index, prev = curr, curr.next, times + 1)
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

asco.remove_at(1)
p asco

