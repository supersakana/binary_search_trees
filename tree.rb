# frozen_string_literal: true

# require_relative 'node.rb'

# takes an array
class Tree
  attr_accessor :array, :roott

  def initialize(array)
    @array = array
    @root = build_tree(array)
  end
end
