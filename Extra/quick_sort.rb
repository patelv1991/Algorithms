# Implement quick sort

# Naive version
def quick_sort(arr)
  return arr if arr.length < 2
  arr.shuffle!
  pivot = arr.shift

  left = []
  right = []

  arr.each do |num|
    if num <= pivot
      left << num
    else
      right << num
    end
  end

  quick_sort(left) + [pivot] + quick_sort(right)
end

# More advanced solution
class Array
  def quick_sort!(start = 0, len = length)
    return self if len < 2
    swap!(start, rand(len) + start)
    pivot = partition!(start, len)
    quick_sort!(start, pivot - start)
    quick_sort!(pivot + 1, len - pivot + start - 1)
  end

  def partition!(start, len)
    pivot = start
    i = pivot.next
    while i < start + len
      if self[i] < self[pivot]
        swap!(i, pivot.next)
        swap!(pivot, pivot.next)
        pivot += 1
      end
      i += 1
    end
    pivot
  end

  def swap!(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end

end
