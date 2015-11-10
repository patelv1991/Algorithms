# Given an array and index, find if it's possible to reach 0 by starting at the
# index and repeatedly moving left/right by the distance found at array[index].
#
# Hint: Use memoization to record where you've been.


def can_win(arr, index)
  return true if arr[index] == 0

  to_visit = [index]
  visited = Hash.new
  len = arr.length

  until to_visit.empty?
    val = arr[index]
    visited[index] = true
    return true if val == 0

    next_left = left_side(index, val)
    next_right = right_side(index, val, len)

    to_visit << next_left if next_left && !visited[next_left]
    to_visit << next_right if next_right && !visited[next_right]

    index = to_visit.shift
  end

  false
end

def left_side(index, val)
  ((index - val) >= 0) ? (index - val) : nil
end

def right_side(index, val, len)
  ((index + val <= len)) ? (index + val) : nil
end
