#Given a binary tree t, determine whether it is symmetric around its center, i.e. each side mirrors the other


# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
# 
def areSymmetric?(left, right)
    return true if left.nil? && right.nil? 
    return false if left.nil? || right.nil?
    return false if left.value != right.value 
    
    if areSymmetric?(left.left, right.right) == false 
        return false
    end 
    areSymmetric?(left.right, right.left)
end 

def isTreeSymmetric(t)
    return true if t.nil?
    return areSymmetric?(t.left, t.right)
end


t = {
    "value": 1,
    "left": {
        "value": 2,
        "left": {
            "value": 3,
            "left": null,
            "right": null
        },
        "right": {
            "value": 4,
            "left": null,
            "right": null
        }
    },
    "right": {
        "value": 2,
        "left": {
            "value": 4,
            "left": null,
            "right": null
        },
        "right": {
            "value": 3,
            "left": null,
            "right": null
        }
    }
}

isTreeSymmetric(t) = true


# Note: Your solution should have only one BST traversal and O(1) extra space complexity, since this is what you will be asked to accomplish in an interview.

# A tree is considered a binary search tree (BST) if for each of its nodes the following is true:
# 
# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and the right subtrees must also be binary search trees.
# Given a binary search tree t, find the kth smallest element in it.
# 
# Note that kth smallest element means kth element in increasing order. See examples for better understanding.
# #
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def kthSmallestInBST(t, k)
  count = 0
  cur = t 
  smallest = nil
  while cur
    if cur.left.nil?
      count += 1
      if count == k
        smallest = cur.value
      end
      cur = cur.right
    else
      prev = cur.left
      while prev.right && prev.right != cur 
        prev = prev.right 
      end
      if prev.right.nil?
        prev.right = cur
        cur = cur.left
      else
        prev.right = nil
        count += 1
        if count == k
          smallest = cur.value
        end 
        cur = cur.right
      end 
    end
  end 
  smallest
end