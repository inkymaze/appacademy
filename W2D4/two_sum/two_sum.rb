#space: O(n^2)
#time: O(n^2)
def bad_two_sum?(arr, target_sum)
  sum_arr = []
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      sum_arr << el1 + el2 if idx2 > idx1
    end
  end
  sum_arr.include?(target_sum)
end

#space: O(n)
#time: O(nlogn)
def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  first_pointer = 0
  second_pointer = arr.length-1
  until second_pointer <= first_pointer
    if target_sum > arr[first_pointer]+arr[second_pointer]
      first_pointer += 1
    elsif target_sum < arr[first_pointer] + arr[second_pointer]
      second_pointer -= 1
    else
      return true
    end
  end
  false
end

#space: O(n)
#time: O(nlogn)
def okay2_two_sum?(arr, target_sum)
  arr = arr.sort
  arr.each do |el|
    result = arr.bsearch {|num| num == target_sum - el }
    return true if result && result != el
  end
  false
end

#space: O(n)
#time: O(n)
def two_sum?(arr,target_sum)
  newhash = Hash.new
  arr.each do |el|
    remaining_num = target_sum - el
    return true if newhash[remaining_num]
    newhash[el] = el
  end
  false
end
