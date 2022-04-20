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

      root.data < key ? root.right = insert(root.right, key) : root.left = insert(root.left, key)

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

  # finds traverses the left side of the tree until minimum node is found
  def min_value(node)
    current = node
    current = current.left until current.left.nil?
    current
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

  def level_order(root)
    return root if root.nil?

    output = []
    q = [root]

    until q.empty?
      current = q[0]
      output.push(current.data)
      yield current if block_given?
      q.push(current.left) unless current.left.nil?
      q.push(current.right) unless current.right.nil?
      q.shift
    end
    output
  end

  def inorder(root, output = [])
    return output if root.nil?

    inorder(root.left, output)

    yield root if block_given?
    output.push(root.data)
    inorder(root.right, output)
  end

  def preorder(root, output = [])
    return output if root.nil?

    # yield root if block_given?
    output.push(root.data)
    preorder(root.left, output)
    preorder(root.right, output)
  end

  # returns nodes from the bottom of the bst in order
  def postorder(root, output = [])
    return output if root.nil?

    postorder(root.left, output)
    postorder(root.right, output)
    yield root if block_given?
    output.push(root.data)
  end

  def height(root)
    return 0 if root.nil?

    left_height = height(root.left)
    right_height = height(root.right)

    left_height > right_height ? left_height + 1 : right_height + 1
  end

  # tbc
  def depth(root)
    return 0 if root.nil?

    left_depth = depth(root.left)
    right_depth = depth(root.right)

    left_depth > right_depth ? left_depth + 1 : right_depth + 1
  end

  def balanced?(root)
    left = height(root.left)
    right = height(root.right)
    dif = if left >= right
            left - right
          else
            right - left
          end

    dif <= 1
  end

  def rebalance(root)
    new_tree = inorder(root)
    @root = build_tree(new_tree.sort)
  end

  # prints bst in cool format
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
