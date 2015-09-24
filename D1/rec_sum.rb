# Write a function that takes an array of integers and returns their sum.
# Use recursion.

def rec_sum(arr)
  return 0 if arr.empty?
  arr.shift + rec_sum(arr)
end
