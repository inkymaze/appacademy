// # isPalindrome
// #
// # Write a JavaScript function that takes a string and returns true if it's a palindrome, false if it's not. Use JavaScript.
// #
// # This solution takes less time and memory than rebuilding the string backward and comparing the two.


function isPalindrome(str) {
  for (let i = 0; i < str.length/2; i++) {
    if (str[i] !== str[str.length - 1 - i]) {
      return false
    }

  }
  return true
}
