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
