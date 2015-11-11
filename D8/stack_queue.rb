# Implement a queue using stacks. That is, write enqueue and dequeue using
# only push and pop operations.
#
# In terms of performance, enqueue should be O(1), but dequeue may be worst-case
# O(n). In terms of ammortized time, dequeue should be O(1). Prove that your
# solution accomplishes this.

class StackQueue
  def initialize
    @in, @out = [], []
  end

  def enqueue(val)
    @in << val
  end

  def dequeue
    if @out.empty?
      @out << @in.pop until @in.empty?
    end
    @out.pop
  end

  def values
    @out + @in
  end
end
