require "./node.rb"

class LinkedList
  attr_reader :node

  def initialize(data = nil)
    @head = Node.new(data) unless data.nil?
  end

  # add item to the start of the list
  def prepend(data)
    current_head = @head
    @head = Node.new(data)
    @head.next = current_head
  end

  # get first item in list
  def top_front
    @head
  end

  # remove the first item from the list
  def pop_front
    @head = @head.next
  end

  # add new item to the end of the list
  def append(data)
    if(@head.nil?)
      @head = Node.new(data) and return
    end

    current_head_node = @head
    while(current_head_node)
      break if(current_head_node.next.nil?)
      current_head_node = current_head_node.next
    end

    current_head_node.next = Node.new(data)
  end

  # is the list empty
  def empty?
    @head == nil
  end

  # print out all the items in the list
  def print_list(node = @head)
    p node.data
    print_list(node.next) unless node.next.nil?
  end

end

l = LinkedList.new
l.append("Data 1")
l.append("Data 2")
l.append("Data 3")
l.prepend("Data 0")
l.prepend("Data -1")
l.append("Data 4")
l.pop_front
l.pop_front
l.print_list
