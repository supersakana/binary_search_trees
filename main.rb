# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

bst = Tree.new(Array.new(15) { rand(1..100) })

bst.pretty_print
p bst.balanced?(bst.root)

p bst.level_order(bst.root)
p bst.preorder(bst.root)
p bst.postorder(bst.root)
p bst.inorder(bst.root)

bst.insert(bst.root, 5)
bst.insert(bst.root, 1)
bst.insert(bst.root, 3)
bst.insert(bst.root, 4)

bst.pretty_print
p bst.balanced?(bst.root)

bst.rebalance(bst.root)
bst.pretty_print
p bst.balanced?(bst.root)

p bst.level_order(bst.root)
p bst.preorder(bst.root)
p bst.postorder(bst.root)
p bst.inorder(bst.root)
