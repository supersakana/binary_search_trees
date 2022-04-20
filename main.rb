# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

bst = Tree.new([1, 2, 3, 4, 5, 6, 7])

bst.insert(bst.root, 8)
bst.insert(bst.root, 9)
bst.insert(bst.root, 10)

bst.pretty_print
p bst.balanced?(bst.root)
bst.rebalance(bst.root)
bst.pretty_print
