def digital_root_rec(num)
  return num if num < 10
  digital_root_rec((num/10) + (num%10))
end


def digital_root_iter(num)
  return num if num < 10
  while num > 10
    num = digital_root_helper(num)
  end
  num
end

def digital_root_helper(num)
  root = 0
  while num > 0
    root += (num % 10)
    num /= 10
  end
  root
  # (num / 10) + (num % 10)
end
