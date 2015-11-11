def look_and_say(arr)
  result = [[1, arr[0]]]

  i = 1
  while i < arr.length
    prev = arr[i - 1]
    prev_count = result[-1][0]

    if prev == arr[i]
      result[-1][0] += 1
    else
      result << [1, arr[i]]
    end

    i += 1
  end
  result
end
