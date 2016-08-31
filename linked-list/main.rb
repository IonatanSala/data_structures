require_relative "./linked_list.rb"

l = LinkedList.new
l.prepend("Data 1")
l.prepend('Data 0')
l.append("Data 2")
l.pop_front
l.pop_back
l.print_list
p l.find?("Data 1")
