# You are given an array and a random number generator. Shuffle the array.
require 'byebug'
def rg(num)
  rand(num)
end

def shuffle(arr, rg = method(:rg))
  length = arr.length

  arr.each_with_index do |num, idx|
    new_idx = rg.call(length)
    arr[idx], arr[new_idx] = arr[new_idx], arr[idx]
  end
  arr
end

prc = Proc.new { |n| rand(n) }

def shuffle2(arr, &prc)
  len = arr.length
  arr.each_with_index do |num, idx|
    new_idx = prc.call(len)
    arr[idx], arr[new_idx] = arr[new_idx], arr[idx]
  end
  arr
end

p shuffle2([1,2,3,4,5], &prc)
