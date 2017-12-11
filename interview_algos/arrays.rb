# A cryptarithm is a mathematical puzzle for which the goal is to find the correspondence between letters and digits, such that the given arithmetic equation consisting of letters holds true when the letters are converted to digits.
#
# You have an array of strings crypt, the cryptarithm, and an an array containing the mapping of letters and digits, solution. The array crypt will contain three non-empty strings that follow the structure: [word1, word2, word3], which should be interpreted as the word1 + word2 = word3 cryptarithm.
#
# If crypt, when it is decoded by replacing all of the letters in the cryptarithm with digits using the mapping in solution, becomes a valid arithmetic equation containing no numbers with leading zeroes, the answer is true. If it does not become a valid arithmetic solution, the answer is false.
#
# Example
#
# For crypt = ["SEND", "MORE", "MONEY"] and
#
# solution = [['O', '0'],
#             ['M', '1'],
#             ['Y', '2'],
#             ['E', '5'],
#             ['N', '6'],
#             ['D', '7'],
#             ['R', '8'],
#             ['S', '9']]
# the output should be
# isCryptSolution(crypt, solution) = true.
def isCryptSolution(crypt, solution)
    match = {}
    solution.each do |set|
        match[set[0]] = set[1]
    end

    nums = []
    temp = ""
    crypt.each do |word|
        word.each_char do |let|
            temp += match[let]
        end
        if temp[0] == '0' && temp.size > 1
            return false
        end
        nums << temp.to_i
        temp = ""
    end
    nums[0,2].reduce(:+) == nums.last
end
