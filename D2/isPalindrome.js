// Write a JavaScript function that takes a string and returns true if it's a
// palindrome, false if it's not. Use Javascript.
// This solution takes less time and memory than rebuilding the string backward
// and comparing the two.

var isPalindrome = function (str) {
  var len = str.length;
  var mid = Math.floor(len / 2);

  var palindrome = true;
  for (var i = 0; i < mid; i++) {
    if (str[i] !== str[len - i - 1]) {
      palindrome = false;
    }
  }
  return palindrome;
};

var isPalindrome2 = function (str) {
  var len = str.length;

  for (var i = 0; i < (len / 2); i++) {
    if (str[i] !== str[len - i - 1]) {
      return false;
    }
  }
  return true;
};
