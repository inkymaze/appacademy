#space: O(n^2)
#time: O(n^2)
def largest_contiguous_subsum_slow(list)
  start = Time.now
  sub_arrs = []
  list.each_with_index do |el, idx|
    sub_arrs << [el]
    list.each_with_index do |el2, idx2|
      sub_arrs << list[idx..idx2] if idx2 > idx
    end
  end

  sub_arrs.map! {|subs| subs.reduce(:+) }
  finish = Time.now
  puts "Runtime: #{finish - start}"
  return sub_arrs.max
end

#space: O(1)
#time: O(n)
def largest_contiguous_subsum_fast(list)
  start = Time.now
  max_sum = list[0]
  cur_sum = list[0]
  list[1..-1].each do |el|
    if el >= cur_sum && cur_sum < 0
      cur_sum = el
    else
      cur_sum += el
    end
    max_sum = cur_sum if cur_sum > max_sum
  end
  finish = Time.now
  puts "Runtime: #{finish - start}"
  return max_sum
end
