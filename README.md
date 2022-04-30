# Binary Search Trees

This is a respository for the completed project for The Odin Project. This project is to get familiar with BFS and DFS algorithms and to think recursively, where applicable.

## The Binary Search Tree class has the following methods:

**#build_tree** - Takes an array of data and turns it into a balanced binary tree, recursively.

**#insert** - Takes a value and inserts it into the tree iteratively

**#instert_recursive** - Takes a value and inserts it into the tree, recursively

**#delete** - Takes a value and deletes it from the tree if it's already in the tree

**#find_iterative** - Takes a value and returns the node with the given value, if the value is found, otherwise, it returns nil. This is an iterative solution

**#find_recursive** - Takes a value and returns the node with the given value, if the value is found, othersie, it returns nil. This is a recursive implementaion

**#find_parent** - Takes a value and returns the parent of the node with the given value if the value is found, otherwise, it returns nil. This is a recursive solution

**#get_next_biggest** - Takes a node and returns the node with a value that is the smallest value in the tree that is also larger than the value of the given node

**#level_order** - Returns an array of all the values of the nodes in level order. Can also be used with blocks where the order follows level order

**#inorder** - Returns an array of all values of the nodes inorder. Can be used with blocks

**#preorder** - Returns an array of all values of the nodes in preorder. Can be used with blocks

**#postorder** - Returns an array of all values of the nodes in postorder. Can be used with blocks

**#height** - Returns the height of a given node

**#depth** - Returns the depth of a given node

**#balanced?** - Returns a boolean of the status of the balance of the tree

**#rebalance** - Returns a new balanced tree if the tree is not balanced

## Script Driver

The script driver performs the following:

1. Generates an Array of 15 elements between 1 - 100

2. Creates a binary search tree from the Array

3. Prints the balance status of the tree

4. Prints the values of the nodes in level order, preorder, postorder, and inorder

5. Iteratively inserts nodes with values 101 and 102 and recursively inserts a node with value 210

6. Prints the balance status of the tree

7. Rebalances the tree

8. Prints the balance status of the rebalanced tree

9. Prints values of the nodes in the tree in level order, preorder, postorder, and inorder
