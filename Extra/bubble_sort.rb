# Implement bubble sort

def bubble_sort(arr)
  flag = false

  until flag
    flag = true

    arr.each_with_index do |_, idx|
      next if idx == arr.length - 1

      if arr[idx]  > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        flag = false
      end
    end
  end
  
  arr
end
