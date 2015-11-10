def common_subsets(arr1, arr2)
  intersection(subsets(arr1), subsets(arr2))
end

def subsets(arr)
  return [[]] if arr.empty?

  val = arr[0]
  subs = subsets(arr.drop(1))
  new_subs = subs.map { |sub| [val] + sub }

  subs + new_subs
end

def intersection(arr1, arr2)
  seen = Hash.new(0)
  intersection = []

  arr1.each do |i|
    seen[i] += 1
  end

  arr2.each do |i|
    intersection << i if seen[i] > 0
    seen[i] -= 1
  end

  intersection
end
