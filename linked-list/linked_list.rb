require "./node.rb"

class LinkedList
  attr_reader :head, :tail

  def initialize(data = nil)
    unless data.nil?
      @head = Node.new(data)
      @tail = @head
    end
  end

  # add item to the start of the list
  def prepend(data)
    new_node = Node.new(data)

    if(@head.nil?)
      @head = new_node
      @tail = @head
      return
    end

    current_head = @head
    @head = new_node
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
    new_node = Node.new(data)
    if(@head.nil?)
      @head = new_node
      @tail = @head
      return
    end

    # add item at the end of the tail
    @tail.next = new_node
    # update the tail to be new item
    @tail = @tail.next
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
