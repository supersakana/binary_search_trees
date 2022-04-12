# frozen_string_literal: true

# require_relative 'tree.rb'

# contains data, left, and right
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(_data, left, right)
    @pointer = pointer
    @left = left
    @right = right
  end
end
