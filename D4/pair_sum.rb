# Given an array of integers, return all pairs that sum up to a specified value
# k. List the pairs in [min, max] order.

def pair_sum(arr, k)
  possible_pairs = {}
  pairs = []
  arr.each do |num|
    if possible_pairs[num]
      pairs << order(num, possible_pairs[num])
    else
      possible_pairs[k - num] = num
    end
  end
  pairs
end

def order(num1, num2)
  if num1 < num2
    return [num1, num2]
  else
    return [num2, num1]
  end
end
