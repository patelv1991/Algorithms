# Write a function that takes an integer and returns it in binary form.

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

def binary2(num)
  result = []

  # Technically this unshift unnecessarily slow. I could push each
  # time, then reverse! after the loop.
  until num == 0
    result.unshift(num % 2)
    num /= 2
  end

  result.empty? ? "0" : result.join
end
