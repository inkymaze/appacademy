# fibs
#
# Write a function, fibs(num) which returns the first n elements from the fibonnacci sequence, given n.
#
# Solve it both iteratively and recursively.

# iter
def fibs(num)
  fibs = [0,1]
  until fibs.size == num
    fibs << (fibs[-1] + fibs[-2])
  end
  fibs
end

# recursive
# O(n) time and space (O(n) frames on the call stack )
def fibs_rec(num)
  return [] if num == 0
  return [0] if num == 1
  return [0, 1] if num == 2

  prev_nums = fibs_rec(num - 1)
  prev_nums << prev_nums[-1] + prev_nums[-2]
end


# valid_ip?

# Write a metho
# d that takes a string as input. It should return true if the input is a valid IPv4 address (ie. anything between 0.0.0.0 and 255.255.255.255 is valid).?

def valid_ip?(str)
  nums = str.split(".").map(&:to_i)
  return false if nums.size != 4
  nums.all? { |num| num >= 0 && num <= 255 }
end


# sum_from_file

# Write a method that reads in a file of integers, one per line, and sums them. Skip the line if it begins with a "#".

def sum_from_file(file)
  nums = File.readlines(file)
            .reject {|n| n[0] = "#"}
            .map(&:to_i)
  nums.reduce(:+)
end


# shuffle

# You are given an array and a random number generator. Shuffle the array.

def shuffle(arr)
  (0...arr.size).each do |i|
    ran_idx = i + rand(arr.size - i)
    arr[i], arr[ran_idx] = arr[ran_idx], arr[i]
  end
  arr
end
