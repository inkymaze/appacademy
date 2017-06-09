#space: O(n)
#time: O(n^2)
def max_windowed_range_slow(arr, window_size)
  current_max_range = nil
  arr[0..arr.length - window_size].each_with_index do |size, i|
    window = arr[i..(i + window_size-1)]
    current_range = window.max - window.min
    current_max_range = current_range unless current_max_range
    current_max_range = current_range if current_range > current_max_range
  end
  current_max_range
end
