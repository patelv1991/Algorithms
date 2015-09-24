# Write a function, fibs(num) which returns the first n elements from the
# fibonnacci sequence, given n.

def fibs(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  fibs = [0, 1]
  while fibs.count < n
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end

# Write a function that returns nth fibonnacci number. Do it recursively
def nth_fib(n, cache = { 1 => 0, 2 => 1 })
  if cache[n]
    cache[n]
  else
    fib = nth_fib(n-1, cache) + nth_fib(n-2, cache)
    cache[n] = fib
  end
end
