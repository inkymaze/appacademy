You're given 2 huge integers represented by linked lists. Each linked list element is a number from 0 to 9999 that represents a number with exactly 4 digits. The represented number might have leading zeros. Your task is to add up these huge integers and return the result in the same format.

Example

For a = [9876, 5432, 1999] and b = [1, 8001], the output should be
addTwoHugeNumbers(a, b) = [9876, 5434, 0].

Explanation: 987654321999 + 18001 = 987654340000.

For a = [123, 4, 5] and b = [100, 100, 100], the output should be
addTwoHugeNumbers(a, b) = [223, 104, 105].

Explanation: 12300040005 + 10001000100 = 22301040105.

Input/Output

[time limit] 4000ms (rb)
[input] linkedlist.integer a

The first number, without its leading zeros.

Guaranteed constraints:
0 ≤ a size ≤ 104,
0 ≤ element value ≤ 9999.

[input] linkedlist.integer b

The second number, without its leading zeros.

Guaranteed constraints:
0 ≤ b size ≤ 104,
0 ≤ element value ≤ 9999.

[output] linkedlist.integer

The result of adding a and b together, returned without leading zeros in the same format.

# Definition for singly-linked list:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end
#

def reverse(node)
 next_node = nil
  prev_node = nil
  cur_node = node 
   while cur_node
     next_node = cur_node.next
     cur_node.next = prev_node
     prev_node = cur_node
     cur_node = next_node
   end 
  prev_node
end 

def addTwoHugeNumbers(a, b)
  carry = 0
  out = ListNode.new(0)
  head = out 
  a = reverse(a)
  b = reverse(b) 
  while a || b 
    if a 
      carry += a.value
      a = a.next
    end 
    if b 
      carry += b.value 
      b = b.next
    end 
    head.next = ListNode.new(carry%10000)
    head = head.next
    carry /= 10000
          
    if carry > 0 
      head.next = ListNode.new(carry)
    end       
  end 
  reverse(out.next)
end
