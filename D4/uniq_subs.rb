# Write a method that finds all the unique substrings for a word.
#
# A results array and the include? method can be used to enforce uniqueness,
# but it adds the time cost of iterating through that array to check for inclusion.
# Keeping track of substrings in a hash is more efficient.

def uniq_subs(str)
  uniq_subs = {}

  i = 0
  while i < str.length
    j = i
    while j < str.length
      uniq_subs[str[i..j]] = true
      j += 1
    end
    i += 1
  end
  uniq_subs.keys
end
