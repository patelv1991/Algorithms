# Given an array of integers (positive and negative) find the largest contiguous
# subsum (sum of a subarray).
#
# You can solve this trivially in O(n**2) time by considering all subarrays.
# Try to solve it in O(n) time with O(1) memory.

def lcs(arr)
  largest_sum = 0
  current_sum = 0
  arr.each do |num|
    sum = current_sum + num
    if sum > 0
      current_sum = sum
    else
      current_sum = 0
    end

    if current_sum > largest_sum
      largest_sum = current_sum
    end
  end
  largest_sum
end

def lcs2(arr)
    current_sum = 0
    max = arr.first || 0  # return 0 for empty array

    arr.each do |el|
        current_sum += el
        max = currrent_sum if max < current_sum
        current_sum = 0 if current_sum < 0
    end

    max
end
