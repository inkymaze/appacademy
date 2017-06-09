#space: O(1)
#time: O(n^2)
def my_min_slow(arr)
  start = Time.now
  min = 0
  arr.each do |el1|
    is_min = true
    arr.each do |el2|
      is_min = false if el2 < el1

    end
    min = el1 if is_min
  end
  finish = Time.now
  puts "Time: #{finish - start}"
  min
end

#space: O(1)
#time: O(n)
def my_min_fast(arr)
  start = Time.now
  min = nil
  arr.each do |el|
    if min.nil? || el < min
      min = el
    end
  end
  finish = Time.now
  puts "Time: #{finish-start}"
  min
end
