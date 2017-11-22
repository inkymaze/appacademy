# Given a sorted integer array that does not contain any duplicates, return a summary of the number ranges it contains.
#
# Example
#
# For nums = [-1, 0, 1, 2, 6, 7, 9], the output should be
# composeRanges(nums) = ["-1->2", "6->7", "9"].
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.integer nums
#
# A sorted array of unique integers.
#
# Guaranteed constraints:
# 0 ≤ nums.length ≤ 15,
# -(231 - 1) ≤ nums[i] ≤ 231 - 1.
#
# [output] array.string

def composeRanges(nums)
 return [] if nums.empty?
 result = []
 tail = nums[0]
 head = nums[0]
 (1...nums.size).each do |i|
  if nums[i] - 1 != nums[i-1]
   if head != tail
    result << "#{tail}->#{head}"
   else
    result << "#{tail}"
   end
   tail = nums[i]
  end
  head = nums[i]
 end
 if head != tail
   result << "#{tail}->#{head}"
 else
  result << "#{tail}"
 end
 result
end
