# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
      return
    end
    node = @root
    dir = direction(value, node)
    while true
      if dir == 'left'
        break if node.left == nil
        node = node.left
      else
        break if node.right == nil
        node = node.right
      end
      dir = direction(value, node)
    end

    if dir == 'left'
      node.left = BSTNode.new(value)
      node.left.parent = node
    else
      node.right = BSTNode.new(value)
      node.right.parent = node
    end
  end

  def find(value, tree_node = @root)
    node = tree_node
    dir = direction(value, @root)
    while true
      break if node.value == value
      if dir == 'left'
        return nil if node.left == nil
        node = node.left
      else
        return nil if node.right == nil
        node = node.right
      end
      dir = direction(value, node)
    end
    return node

  end

  def delete(value)
    target = find(value, @root)
    return nil if target == nil
    if target == @root
      @root = nil
      return
    end

    case children(target)
    when 0
      new_child(target, target.parent, nil)
    when 1
      if target.left
        new_child(target, target.parent, target.left)
      else
        new_child(target, target.parent, target.right)
      end
    when 2
      max = maximum(target.left)
      target.value = max.value
      if children(max) == 0
        new_child(max, max.parent, nil)
      else
        new_child(max, max.parent, max.left)
        max.left.parent = max.parent
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    while tree_node.right
      tree_node = tree_node.right
    end
    tree_node
  end

  def depth(tree_node = @root)
    return -1 unless tree_node
    left = depth(tree_node.left)
    right = depth(tree_node.right)
    if left >= right
      return left += 1
    else
      return right += 1
    end
  end

  def is_balanced?(tree_node = @root)
    depth(tree_node.left) == depth(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr unless tree_node
    in_order_traversal(tree_node.left, arr)
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr)
    arr
  end

  def self.sort_tree(tree_node = @root, arr = [])
    return arr unless tree_node
    sort_tree(tree_node.right, arr)
    arr << tree_node
    sort_tree(tree_node.left, arr)
    arr
  end


  private
    def direction(value, node)
      if value < node.value
        return 'left'
      else
        return 'right'
      end
    end

    def new_child(target,parent, value)
      if parent.right == target
        parent.right = value
      else
        parent.left = value
      end
      if value
        value.parent = parent
      end
    end

    def children(node)
      count = 0
      count += 1 if node.left
      count += 1 if node.right
      count
    end
end
