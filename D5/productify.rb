# Given a list of numbers in an array, replace all the numbers with the product
# of all other numbers. Do this in O(n) time without using division.

def productify_easy(arr)
  product = arr.inject(:*)
  new_arr = []
  arr.each do |num|
    new_arr << product / num
  end
  new_arr
end

def productify_hard(arr)
  left, right, product = [1], [1], []

  current_product = 1
  arr.each_with_index do |num, idx|
    next if idx == 0
    current_product *= arr[idx - 1]
    left << current_product
  end

  current_product = 1
  reversed_arr = arr.reverse
  reversed_arr.each_with_index do |num, idx|
    next if idx == 0
    current_product *= reversed_arr[idx - 1]
    right << current_product
  end

  arr.each_index do |idx|
    product << left[idx] * right[arr.length - 1 - idx]
  end
  product
end
