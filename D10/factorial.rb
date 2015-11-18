# Implement factorial

def factorial(num)
  return nil if num < 0

  product = 1

  while num >= 1
    product = product * num
    num -= 1
  end
  product
end
