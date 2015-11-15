# Given an array, and a window size w, find the maximum max - min within a range
# of w elements.
#
# For instance:
#
# windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# # still 6!
# windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
#
# You can write a naive version that considers all subarrays of size w. However,
# if w = n/2 then there are n/2 subarrays of length n/2 to consider. Therefore,
# I would call this solution quadratic. Write it anyway :-)
#
# Let's improve it to O(n). Here are some hints:
#
# First solve MaxStack. Could you write simply a MinMaxStack to track both the
# min and the max in a stack?
# Next, solve StackQueue. Could you use your MinMaxStack to write a
# MinMaxStackQueue which tracks both the min and max.
# Last, can you use your MinMaxStackQueue to solve the problem?

# Naive way to solve (quadratic runtime O(n^2))

def windowed_max_range(arr, window)
  subarrays = []
  i = 0

  while i + window <= arr.length
    subarray = []
    count = 0

    j = i
    until count == window
      subarray << arr[j]
      j += 1
      count += 1
    end

    subarrays << subarray
    i += 1
  end

  biggest_diff = 0
  subarrays.each do |subarray|
    min = nil
    max = nil

    subarray.each do |num|
      min = num  if min.nil? || num < min
      max = num if max.nil? || num > max
    end

    biggest_diff = max - min if max-min > biggest_diff
  end

  biggest_diff
end

# O(n) solution
class MinMaxStack
  def initialize
    # stack format: [{value: val, min: stack_minimum, max: stack_maximum}]
    @stack = []
  end

  def push(val)
    if @stack.empty?
      @stack << {
        value: val,
        min: val,
        max: val
      }
    else
      @stack << {
        value: val,
        min: (self.min < val) ? self.min : val,
        max: (self.max > val) ? self.max : val
      }
    end
    @stack
  end

  def pop
    @stack.pop
  end

  def min
    @stack.last[:min] unless @stack.empty?
  end

  def max
    @stack.last[:max] unless @stack.empty?
  end
end

class MinMaxStackQueue
end
