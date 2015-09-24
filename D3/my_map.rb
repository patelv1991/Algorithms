# Implement `Array#my_map` in ruby

class Array
  def my_map(&block)
    array = []
    self.each do |num|
      array.push(block.call(num))
    end
    array
  end
end
