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


#
# Consider a special family of Engineers and Doctors. This family has the following rules:
#
# Everybody has two children.
# The first child of an Engineer is an Engineer and the second child is a Doctor.
# The first child of a Doctor is a Doctor and the second child is an Engineer.
# All generations of Doctors and Engineers start with an Engineer.
# We can represent the situation using this diagram:
#
#                 E
#            /         \
#           E           D
#         /   \        /  \
#        E     D      D    E
#       / \   / \    / \   / \
#      E   D D   E  D   E E   D
# Given the level and position of a person in the ancestor tree above, find the profession of the person.
# Note: in this tree first child is considered as left child, second - as right.
#
# Example
#
# For level = 3 and pos = 3, the output should be
# findProfession(level, pos) = "Doctor".
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] integer level
#
# The level of a person in the ancestor tree, 1-based.
#
# Guaranteed constraints:
# 1 ≤ level ≤ 30.
#
# [input] integer pos
#
# The position of a person in the given level of ancestor tree, 1-based, counting from left to right.
#
# Guaranteed constraints:
# 1 ≤ pos ≤ 2(level - 1).
#
# [output] string
#
# Return Engineer or Doctor.


def findProfession(level, pos)

  if level == 1
    return 'Engineer'
  end
  if findProfession(level - 1, (pos + 1)/2) == 'Doctor'
    return (pos % 2) == 1 ? 'Doctor' : 'Engineer'
  end
  pos % 2 == 1 ? 'Engineer' : 'Doctor'
end
