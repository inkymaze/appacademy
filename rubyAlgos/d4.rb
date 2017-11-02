# uniq_subs
#
# Write a method that finds all the unique substrings for a word.
#
# Solution
#
# A results array and the include? method can be used to enforce uniqueness, but it adds the time cost of iterating through that array to check for inclusion. Keeping track of substrings in a set or hash is more efficient (O(1) lookup time).


def uniq_subs(word)
  subs = {}
  word.length.times do |i|
    (i...word.length).each do |j|
      if !subs[str[i..j]]
        subs[str[i..j]] = str[i..j]
      end
    end
  end
end


# uniq_subs("abababababababababababababababababab").count == 71


# largest_contiguous_subsum

# Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).

# You can solve this trivially in O(n**2) time by considering all subarrays. Try to solve it in O(n) time with O(1) memory.


#iterative solution
def largest_contiguous_subsum(nums)
  running_sum = 0
  max = nums.first || 0

  nums.each do |n|
    running_sum += n
    max = running_sum if max < running_sum
    running_sum = 0 if running_sum < 0
  end
  max
end

#recursive

def lcs(nums)

end
