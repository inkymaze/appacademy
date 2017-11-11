
# You have a binary tree t. Your task is to find the largest value in each row of this tree. In a tree, a row is a set of nodes that have equal depth. For example, a row with depth 0 is a tree root, a row with depth 1 is composed of the root's children, etc.

# Return an array in which the first element is the largest value in the row with depth 0, the second element is the largest value in the row with depth 1, the third element is the largest element in the row with depth 2, etc.
#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def largestValuesInTreeRows(t)
  return [] unless t
  queue = [t]
  children = []
  out = [t.value]
  row_largest = nil
  until queue.empty?
    current = queue.shift
    if current.left
      children << current.left
      if row_largest.nil? || row_largest < current.left.value
        row_largest = current.left.value
      end
    end
    if current.right
      children << current.right
      if row_largest.nil? || row_largest < current.right.value
        row_largest = current.right.value
      end
    end
    if queue.empty?
      queue = children
      out << row_largest if row_largest
      row_largest = nil
      children = []
    end
  end
  out
end


# We're going to store numbers in a tree. Each node in this tree will store a single digit (from 0 to 9), and each path from root to leaf encodes a non-negative integer.
#
# Given a binary tree t, find the sum of all the numbers encoded in it.
#
# Example
#
# For
# t = {
#     "value": 1,
#     "left": {
#         "value": 0,
#         "left": {
#             "value": 3,
#             "left": null,
#             "right": null
#         },
#         "right": {
#             "value": 1,
#             "left": null,
#             "right": null
#         }
#     },
#     "right": {
#         "value": 4,
#         "left": null,
#         "right": null
#     }
# }
# the output should be
# digitTreeSum(t) = 218.
# There are 3 numbers encoded in this tree:
#
# Path 1->0->3 encodes 103
# Path 1->0->1 encodes 101
# Path 1->4 encodes 14
# and their sum is 103 + 101 + 14 = 218.

#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def digitTreeSum(t)
  paths = []
  dfs(t, paths)

  paths.reduce(:+)
end

def dfs(node, paths, curVal = 0)
  puts curVal
  val = node.value + (curVal*10)
  puts 'val'
  puts val
  if node.left.nil? && node.right.nil?
    paths << val
  else
    if node.left
      dfs(node.left, paths, val)
    end
    if node.right
      dfs(node.right, paths, val)
    end
  end
end
