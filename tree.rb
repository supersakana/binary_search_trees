# frozen_string_literal: true

require_relative 'node'

# takes an array
class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array
    @root = build_tree(array)
    @size = 0
  end

  def build_tree(array)
    return nil if array.empty?

    mid = ((array.length - 1) / 2).floor
    root_node = Node.new(array[mid])
    p root_node.data
    root_node.left = build_tree(array[0...mid])
    root_node.right = build_tree(array[(mid + 1)..-1])

    root_node
  end
end
