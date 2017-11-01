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


uniq_subs("abababababababababababababababababab")
