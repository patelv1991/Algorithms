# Implement a stack with a method max that returns the maximum value of the
# stack. max should run in O(1) time.

class MaxStack
  attr_reader :value

  def initialize
    @value = []
  end

  def pop
    val, max = @value.pop
    val
  end

  def push(val)
    if @value.empty?
      @value << [val, val]
      return @value
    end

    if val > max
      @value << [val, val]
    else
      @value << [val, max]
    end
  end

  def max
    @value.last[1] unless @value.empty?
  end

end
