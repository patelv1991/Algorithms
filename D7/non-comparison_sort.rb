# Part 1: Say that I gave you an array of length n, containing the numbers 1..n
# in jumbled order. "Sort" this array in O(n) time. You should be able to do
# this without looking at the input.
#
# Part 2: Say that I give you an array of length n with numbers in the range
# 1..N (N >= n). Sort this array in O(n + N) time. You may use O(N) memory.
#
# Part 3: Say I give you an array of n strings, each of length k. I claim that,
# using merge sort, you can sort this in O(knlog(n)), since comparing a pair of
# strings takes O(k) time.
#
# I want you to beat that. Sort the strings in O(kn). Hint: do not compare any
# two strings. You may assume all strings contain only lowercase letters a..z
# without whitespace or punctuation.

def sort1(arr)
  (1..arr.length).to_a
end

def sort2(arr)
  inputs = Hash.new
  sorted_arr = []
  max = nil

  arr.each do |i|
    inputs[i] = true
    if max.nil? || arr[i] > max
      max = arr[i]
    end
  end

  max.times do |i|
    sorted_arr << (i + 1) if inputs[i + 1]
  end

  sorted_arr
end

def sort3(arr, str_len)
  (str_len - 1).downto(0) do |i|
    buckets = Array.new(26) { [] }

    arr.each do |str|
      letter = str[i]
      buckets[letter.ord - "a".ord] << str
    end

    arr = []
    buckets.each do |bucket|
      bucket.each do |str|
        arr << str
      end
    end
  end

  arr
end
