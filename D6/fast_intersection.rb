# Given arr1 and arr2, find the intersection of both sets. It should be trivial
# to write an O(n**2) solution. Use sorting to solve in O(nlog(n)). Next,
# improve this to O(n) time (maybe use a non-array datastructure).

def fast_intersection(arr1, arr2)
  seen = Hash.new
  intersection = []

  arr1.each do |i|
    seen[i] = true
  end

  arr2.each do |i|
    intersection << i if seen[i]
  end

  intersection
end
