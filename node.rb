# frozen_string_literal: true

require_relative 'tree'

# contains data, left, and right
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
