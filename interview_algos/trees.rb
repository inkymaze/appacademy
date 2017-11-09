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