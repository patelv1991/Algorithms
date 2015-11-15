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

  attr_reader :stack

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

  def empty?
    @stack.empty?
  end

  def length
    @stack.length
  end

  def values
    values = []
    @stack.each do |el|
      values << el[:value]
    end
    values
  end
end

class MinMaxStackQueue

  def initialize
    @in = MinMaxStack.new
    @out = MinMaxStack.new
  end

  def enqueue(val)
    @in.push(val)
  end

  def dequeue
    if @out.empty?
      @out.push(@in.pop[:value]) until @in.empty?
    end
    @out.pop
  end

  def queue
    @out.stack.reverse + @in.stack
  end

  def length
    @in.length + @out.length
  end

  def values
    @out.values.reverse + @in.values
  end

  def min
    in_min = @in.min
    out_min = @out.min

    if in_min && out_min
      [in_min, out_min].min
    else
      in_min || out_min
    end
  end

  def max
    in_max = @in.max
    out_max = @out.max

    if in_max && out_max
      [in_max, out_max].max
    else
      in_max || out_max
    end
  end

end

def improved_windowed_max_range(arr, window)
  queue = MinMaxStackQueue.new
  biggest_diff = 0

  arr.each do |el|
    queue.enqueue(el)

    if queue.length > window
      queue.dequeue
    end

    diff = queue.max - queue.min
    biggest_diff = diff if diff > biggest_diff
  end

  biggest_diff
end
