# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

bst = Tree.new([1, 2, 3, 4, 5, 6, 7])
bst.pretty_print

bst.insert(bst.root, 8)
bst.pretty_print

bst.delete(bst.root, 6)
bst.pretty_print

