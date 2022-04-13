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
    root_node.left = build_tree(array[0...mid])
    root_node.right = build_tree(array[(mid + 1)..-1])

    root_node
  end

  def insert(root, key)
    if root.nil?
      Node.new(key)
    else
      return root if root.data == key

      if root.data < key
        root.right = insert(root.right, key)
      else
        root.left = insert(root.left, key)
      end

      root
    end
  end

  def delete(value)
    # deletes a value
  end

  def find(value)
    # accepts a value and returns node with given value
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
