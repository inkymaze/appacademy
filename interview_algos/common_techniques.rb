# Given an array of integers, find the maximum possible sum you can get from one of its contiguous subarrays. The subarray from which this sum comes must contain at least 1 element.
#
# Example
#
# For inputArray = [-2, 2, 5, -11, 6], the output should be
# arrayMaxConsecutiveSum2(inputArray) = 7.
#
# The contiguous subarray that gives the maximum possible sum is [2, 5], with a sum of 7.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.integer inputArray
#
# An array of integers.
#
# Guaranteed constraints:
# 3 ≤ inputArray.length ≤ 105,
# -1000 ≤ inputArray[i] ≤ 1000.
#
# [output] integer
#
# The maximum possible sum of a subarray within inputArray.

def arrayMaxConsecutiveSum2(arr)
  running_max = 0
  current_max = arr.first
  arr.each do |el|
    running_max += el
    if running_max < el
      running_max = el
    end
    if current_max < running_max
      current_max = running_max
    end
  end
  current_max
end

#
# You have an unsorted array arr of non-negative integers and a number s. Find a longest contiguous subarray in arr that has a sum equal to s. Return two integers that represent its inclusive bounds. If there are several possible answers, return the one with the smallest left bound. If there are no answers, return [-1].
#
# Your answer should be 1-based, meaning that the first position of the array is 1 instead of 0.
#
# Example
#
# For s = 12 and arr = [1, 2, 3, 7, 5], the output should be
# findLongestSubarrayBySum(s, arr) = [2, 4].
#
# The sum of elements from the 2nd position to the 4th position (1-based) is equal to 12: 2 + 3 + 7.
#
# For s = 15 and arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], the output should be
# findLongestSubarrayBySum(s, arr) = [1, 5].
#
# The sum of elements from the 1st position to the 5th position (1-based) is equal to 15: 1 + 2 + 3 + 4 + 5.
#
# For s = 15 and arr = [1, 2, 3, 4, 5, 0, 0, 0, 6, 7, 8, 9, 10], the output should be
# findLongestSubarrayBySum(s, arr) = [1, 8].
#
# The sum of elements from the 1st position to the 8th position (1-based) is equal to 15: 1 + 2 + 3 + 4 + 5 + 0 + 0 + 0.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] integer s
#
# The sum of the subarray that you are searching for.
#
# Guaranteed constraints:
# 0 ≤ s ≤ 109.
#
# [input] array.integer arr
#
# The given array.
#
# Guaranteed constraints:
# 1 ≤ arr.length ≤ 105,
# 0 ≤ arr[i] ≤ 104.
#
# [output] array.integer
#
# An array that contains two elements that represent the left and right bounds of the subarray, respectively (1-based). If there is no such subarray, return [-1].

def findLongestSubarrayBySum(s, arr)

  sum_ranges = [0]
  tally = 0
  arr.each do |e|
    tally += e
    sum_ranges << tally
  end

   longest = [-1]
   start = 0
   finish = 0
  while finish < arr.size
    current = sum_ranges[finish + 1] - sum_ranges[start]

    case current <=> s
    when -1
      finish += 1
    when 0
      if longest.size == 1 || (finish - start) > (longest.last - longest.first)
        longest = [start, finish]
      end
      finish += 1
    when 1
      start += 1
    end
  end

  longest.size == 1 ? longest : [longest[0] + 1, longest[1] + 1]
end

# You have an array nums. We determine two functions to perform on nums. In both cases, n is the length of nums:
#
# fi(nums) = nums[0] · nums[1] · ... · nums[i - 1] · nums[i + 1] · ... · nums[n - 1]. (In other words, fi(nums) is the product of all array elements except the ithf.)
# g(nums) = f0(nums) + f1(nums) + ... + fn-1(nums).
# Using these two functions, calculate all values of f modulo the given m. Take these new values and add them together to get g. You should return the value of g modulo the given m.
#
# Example
#
# For nums = [1, 2, 3, 4] and m = 12, the output should be
# productExceptSelf(nums, m) = 2.
#
# The array of the values of f is: [24, 12, 8, 6]. If we take all the elements modulo m, we get:
# [0, 0, 8, 6]. The sum of those values is 8 + 6 = 14, making the answer 14 % 12 = 2.

def productExceptSelf(nums, m)
  left_prod = [1]*nums.size
  right_prod = 1
  (1...nums.size).each do |i|
    left_prod[i] *= (left_prod[i-1] * nums[i-1]) % m
  end
  tally = 0
  (0...nums.size).each do |i|
    tally += (left_prod[-1 - i] * right_prod) % m
    right_prod = (right_prod * nums[-1 - i]) % m

  end

  tally % m
end
