# Implement Insertion Sort

def insertion_sort(arr)

  arr.each_with_index do |num, idx|
    next if idx == 0
    i = idx - 1
    current_idx = idx
    flag = false

    while i >= 0
      if num < arr[i] && num > arr[i - 1]
        arr[i], arr[current_idx] = arr[current_idx], arr[i]
        flag = true
      elsif num < arr[i]
        arr[i], arr[current_idx] = arr[current_idx], arr[i]
      end

      break if flag
      current_idx = i
      i -= 1
    end
    
  end
  arr
end
