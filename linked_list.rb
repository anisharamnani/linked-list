require './node.rb'
require 'pry'

class LinkedList

  attr_accessor :first_node

  def initialize(node=false)
    @first_node = node
  end

  def find(value)
    current_node = @first_node
    next_node = @first_node.next_node
    while next_node
      if next_node.value == value
        return next_node
      end
      current_node = current_node.next_node
      next_node = current_node.next_node
    end
  end

  def add(value)
    current_node = @first_node
    node = Node.new(value)
    if !@first_node
      @first_node = node
    else
      while current_node.next_node
        current_node = current_node.next_node
      end
      link(current_node, node)
    end
  end

  def delete(node)
    current_node = @first_node
    next_node = @first_node.next_node
    binding.pry
    while next_node
      if next_node == node
        link(current_node, next_node.next_node)
        next_node.next_node = nil
        break
      end
      current_node = current_node.next_node
      next_node = current_node.next_node
    end
  end

  private

  def link node1, node2
    node1.next_node = node2
  end

end

