# Write a method, digital_root(num).
# It should sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the
# resulting number. Keep repeating until there is only one digit
# in the result, called the "digital root". Do not use string
# conversion within your method.

# iterative solution
def digital_root(num)
  while num >= 10
    num = digital_root_step(num)
  end
  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += (num % 10)
    num /= 10
  end
  root
end


# recursive solution
def digital_root_rec(num)
  return num if num < 10
  return digital_root_rec((num % 10) + (num / 10))
end

p digital_root_rec(199)
p digital_root_rec(43)

#
# caesar_cipher
#
# Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation. Preserve spaces


def caesar_cipher(str, shift)
  letters = ('a'..'z').to_a

  encrypted = ""
  str.split("").each do |char|
    if char == " "
      encrypted << " "
    else
      new_idx = (letters.index(char) + shift) % 26
      encrypted << letters[new_idx]
    end
  end
  encrypted
end

p caesar_cipher("xyz", 1)


# longest_common_substring

# Write a function, longest_common_substring(str1, str2) that takes two strings and returns the longest common substring. A substring is defined as any consecutive slice of letters from another string.
# time (O(m * n**2)) where n is str1  and m is str2
def longest_common_substring(str1, str2)
  longest = ""
  idx = 0
  while idx < str1.length
    length = longest.length + 1
    while (idx + length) <= str1.length
      end_idx = idx + length
      substring = str1[idx...end_idx]
      longest = substring if str2.include?(substring)
      length += 1
    end
    idx += 1
  end
  longest
end

# sum_rec

# Write a function that takes an array of integers and returns their sum. Use recursion.


def sum_rec(nums)
  return 0 if nums.size == 0
  last_num = nums.pop
  sum_rec(nums) + last_num
end
