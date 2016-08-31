require_relative "./node.rb"

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

  # get last item in the list
  def top_back
    @tail
  end

  # remove the last item in the list
  def pop_back
    if @head.nil?
      p "List is empty"
    end

    if @head == @tail
      @head = nil
      @tail = nil
    else
      current_head = @head
      while !current_head.next.next.nil?
        current_head = current_head.next
      end

      current_head.next = nil
      @tail = current_head
    end
  end

  # check if the data is in the list
  # return a boolean
  def find?(key)
    current_node = @head
    while(current_node)
      if(current_node.data == key)
        return true
      end
      current_node = current_node.next
    end

    return false
  end

  # remove data from the list
  def remove(key)
  end

  # is the list empty
  def empty?
    @head == nil
  end

  # print out all the items in the list
  def print_list(node = @head)
    while(node)
      p node.data
      node = node.next
    end
  end
end
