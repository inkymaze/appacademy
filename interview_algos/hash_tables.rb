def possibleSums(coins, q)
  sums = {0=>true}
  (0...coins.size).each do |i|
    sums.keys.each do |sum|
      q[i].downto(1).each do |remaining|
        sums[remaining * coins[i] + sum] = true
      end
    end
  end
  sums.size - 1
end

# You have a collection of coins, and you know the values of the coins and the quantity of each type of coin in it. You want to know how many distinct sums you can make from non-empty groupings of these coins.
#
# Example
#
# For coins = [10, 50, 100] and quantity = [1, 2, 1], the output should be
# possibleSums(coins, quantity) = 9.
#
# Here are all the possible sums:
#
# 50 = 50;
# 10 + 50 = 60;
# 50 + 100 = 150;
# 10 + 50 + 100 = 160;
# 50 + 50 = 100;
# 10 + 50 + 50 = 110;
# 50 + 50 + 100 = 200;
# 10 + 50 + 50 + 100 = 210;
# 10 = 10;
# 100 = 100;
# 10 + 100 = 110.
# As you can see, there are 9 distinct sums that can be created from non-empty groupings of your coins.


# Question 2 below

# You have an array of integers nums and an array queries, where queries[i] is a pair of indices (0-based). Find the sum of the elements in nums from the indices at queries[i][0] to queries[i][1] (inclusive) for each query, then add all of the sums for all the queries together. Return that number modulo 109 + 7.
#
# Example
#
# For nums = [3, 0, -2, 6, -3, 2] and queries = [[0, 2], [2, 5], [0, 5]], the output should be
# sumInRange(nums, queries) = 10.
#
# The array of results for queries is [1, 3, 6], so the answer is 1 + 3 + 6 = 10.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.integer nums
#
# An array of integers.
#
# Guaranteed constraints:
# 1 ≤ nums.length ≤ 105,
# -1000 ≤ nums[i] ≤ 1000.
#
# [input] array.array.integer queries
#
# An array containing sets of integers that represent the indices to query in the nums array.
#
# Guaranteed constraints:
# 1 ≤ queries.length ≤ 3 · 105,
# queries[i].length = 2,
# 0 ≤ queries[i][j] ≤ nums.length - 1,
# queries[i][0] ≤ queries[i][1].
#
# [output] integer
#
# An integer that is the sum of all of the sums gotten from querying nums, taken modulo 109 + 7.

def sumInRange(nums, queries)
  sum_ranges = {}
  tally = 0
  nums.each_with_index do |n, i|
    tally += n
    sum_ranges[i] = tally
  end
  sum = 0
  queries.each do |q|
    subtract = sum_ranges[q[0] - 1] || 0
    sum += sum_ranges[q[1]] - subtract
  end
  sum % (10**9 + 7)
end
