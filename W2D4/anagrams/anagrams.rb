#space: O(n!)
#time: O(n!)
def first_anagram?(str1, str2)
  str_array = str1.chars
  str_array = str_array.permutation.to_a
  str_array.each do |perm|
    return true if str2 == perm.join
  end
  false
end

#space: O(n)
#time: O(n^2)
def second_anagram?(str1,str2)
  return false unless str1 && str2
  str_array1 = str1.chars
  str_array2 = str2.chars
  str_array1dup = str_array1.dup
  str_array2dup = str_array2.dup
  str_array1.each_with_index do |char,idx|
    if str_array2dup.include?(char)
      str_count = str_array2dup.count(char)
      str_array2dup.delete(char)
      (1...count).times{|num| str_array2dup << char} if str_count > 1
    else
      return false
    end
  end
  str_array2.each_with_index do |char,idx|
    if str_array1dup.include?(char)
      str_count = str_array1dup.count(char)
      str_array1dup.delete(char)
      (1...count).times{|num| str_array1dup << char} if str_count > 1
    else
      return false
    end
  end
  true
end

#space: O(n)
#time: O(nlogn)
def third_anagram?(str1, str2)
  str1 = str1.chars.sort
  str2 = str2.chars.sort

  return false unless str1 == str2
  true
end

#space: O(n)
#time: O(n)
def fourth_anagram?(str1,str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.chars.each do |char|
    hash1[char] += 1
  end

  str2.chars.each do |char|
    hash2[char] += 1
  end

  hash1.each do |k,v|
    return false unless hash2[k] == v
  end
  true
end

#space: O(n)
#time: O(n)
def fifth_anagram?(str1,str2)
  hash1 = Hash.new(0)
  str1.chars.each do |char|
    hash1[char] += 1
  end

  str2.chars.each do |char|
    hash1[char] -= 1
  end
  return hash1.all?{|k,v| v == 0}
end
