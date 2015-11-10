# Given an array, move all zeros to the end. The order of non-zero elements
# does not matter. Ex:
#
# move_zeros([1, 2, 0, 3, 4, 0, 5, 6, 0]) == [1, 2, 6, 3, 4, 5, 0, 0, 0]
#
# Algorithm should be O(n); use O(1) extra space.

require 'byebug'
def move_zeros(arr)

  last_index = arr.length - 1

  arr.each_with_index do |num, idx|
    next unless num == 0
    last_index.downto(idx + 1) do |l|
      next if arr[l] == 0

      arr[idx], arr[l] = arr[l], arr[idx]
      last_index = l - 1
      break
    end
    break if last_index == idx
  end
  arr
end
