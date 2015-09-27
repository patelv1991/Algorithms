# Implement merge sort.

def merge_sort(arr)
  return arr if arr.length < 2

  middle_idx = arr.length / 2
  left = merge_sort(arr[0...middle_idx])
  right = merge_sort(arr[middle_idx..-1])

  merge(left, right)
end

def merge(left, right)
  sorted_arr = []
  until left.empty? || right.empty?
    if left[0] < right[0]
      sorted_arr << left.shift
    else
      sorted_arr << right.shift
    end
  end
  sorted_arr + left + right
end
