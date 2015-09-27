# Implement binary search

def binary_search(arr, target)
  return nil if arr.length < 1 || (arr.length == 1 && arr[0] != target)

  pivot_idx = arr.length / 2
  pivot = arr[pivot_idx]

  if pivot == target
    return pivot_idx
  elsif pivot > target
    binary_search(arr[0...pivot_idx], target)
  else
    sub_result = binary_search(arr[pivot_idx..-1], target)
    if sub_result.nil?
      return nil
    else
      pivot_idx + sub_result
    end
  end
end
