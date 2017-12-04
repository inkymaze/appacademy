#URLify
# write a method to replase all the space in a string with '%20'
# you may assume that the string has sufficient space at the end to hold the additional characters and that your are given the 'true' lenght of the strings
# ex "Mr John Smith    ", 13
#  ex output ; "Mr%20John%20Smtih"

string = "Mr John Smith    "

def URLify(str)
  result = []
  (0...str.length).each do |i|
    if str[i] == " " && str[i + 1] != " " && i + 1 != str.length
      result << "%20"

    else
      result << str[i]
    end
  end

  result.join

end

puts URLify(string)
