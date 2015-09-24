# This solution is implemented in O(n) time complexity with O(n) space complexity

arr = [1,8,5,4,3,2,1]

def stock_picker(arr)
  min = nil
  max = 0
  biggest_diffs = []

  arr.each_with_index do |num, idx|
    if min.nil? || min > num
      min = num
      max = 0
    end

    if max < num
      max = num
      if max - min > 0
        biggest_diffs << [min, max]
      end
    end

  end

  p biggest_diffs
  greatest_diff = 0
  biggest_diffs.each do |min, max|
    greatest_diff = (max - min) if (max - min) > greatest_diff
  end
  greatest_diff

end
