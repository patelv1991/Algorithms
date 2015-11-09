def binary(num)
  max_power = -1
  temp_num = 1
  while temp_num <= num
    temp_num *= 2
    max_power += 1
  end

  diff = num
  binary = ""
  until max_power == -1
    temp_num = (2 ** max_power)
    if temp_num <= diff
      binary += "1"
      diff -= temp_num
    else
      binary += "0"
    end
    max_power -= 1
  end

  binary
end
