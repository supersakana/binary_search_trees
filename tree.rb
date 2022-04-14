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

  def delete(root, key)
    return root if root.nil?

    if key < root.data
      root.left = delete(root.left, key)
    elsif key > root.data
      root.right = delete(root.right, key)
    else
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end
      temp = min_value(root.right)
      root.data = temp.data
      root.right = delete(root.right, temp.data)
    end
    root
  end

  # accepts a value and returns node with given value tbc
  def find(root, key)
    return root.data if root.data == key || root.nil?

    if root.data < key
      root.right = find(root.right, key)
    else
      root.left = find(root.left, key)
    end
  end

  # needed for delete method
  def min_value(node)
    current = node
    current = current.left until current.left.nil?
    current
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
