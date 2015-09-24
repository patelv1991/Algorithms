# Write a method that reads in a file of integers, one per line, and sums them.
# Skip the line if it begins with a "#".

def sum_from_file(filename)
  sum = 0
  File.open(filename, 'r').each_line do |line|
    next if line[0] == "#"
    sum += line.to_i
  end
  sum
end

def sum_from_file2(filename)
  nums = File
         .readlines(filename)
         .select { |line| line[0] != "#" }
         .map(&:to_i)

  nums.inject(:+)
end
