# Write a function that takes an array and returns all of its subsets.
# How many sets will it return?

def subsets(arr)
  return [[]] if arr.length == 0

  val = arr[0]
  subs = subsets(arr.drop(1))
  new_subs = subs.map { |sub|  [val] + sub }
  subs + new_subs
end
