# Assume an array of non-negative integers. A second array is formed by shuffling
# the elements of the first array and deleting a random element. Given these two
# arrays, find which element is missing in the second array. Do this in linear
# time with constant memory use.

def missin_num(arr1, arr2)
  arr1.inject(:+) - arr2.inject(:+)
end
