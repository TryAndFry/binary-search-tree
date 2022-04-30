require_relative 'binary_search_tree.rb'


arr = (Array.new(15) { rand(1..100) })

bst = Tree.new(arr)

p bst.balanced?

p bst.level_order, bst.preorder, bst.postorder, bst.inorder

bst.insert(101) ; bst.insert(102) ; bst.insert_recurssive(210)

p bst.balanced?

bst.rebalance

p bst.balanced?

p bst.level_order, bst.preorder, bst.postorder, bst.inorder