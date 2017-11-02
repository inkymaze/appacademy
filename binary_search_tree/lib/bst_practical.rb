require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  sorted_arr = BinarySearchTree.sort_tree(tree_node)
  sorted_arr[k-1]
end
