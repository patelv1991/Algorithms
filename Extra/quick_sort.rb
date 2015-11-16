# Implement quick sort

# naive version
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
