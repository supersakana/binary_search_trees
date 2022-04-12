# frozen_string_literal: true

# require_relative 'node.rb'
# require_relative 'tree.rb'

my_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324].sort.uniq

bst = Tree.new(my_array)
p bst
