# Write a function, common_substrings(str1, str2) that takes two strings and
# returns the longest common substring.

def common_substrings(str1, str2)
  longest_substring = ""

  i = 0
  while i < str1.length
    j = 0
    while j < str1.length
      sub = str1[i..j]
      if str2.include?(sub) && sub.length > longest_substring.length
        longest_substring = sub
      end
      j += 1
    end
    i += 1
  end
  longest_substring
end


def common_substrings_2(str1, str2)
  if str1.length < str2.length
    shorter = str1
    longer = str2
  else
    shorter = str2
    longer = str1
  end
  return shorter if longer.include?(shorter)

  count = 0
  i = shorter.length - 1
  while i >= 0
    j = 0
    while j <= i
      sub = shorter[j..i]
      p "count: #{count += 1}"
      return sub if longer.include?(sub)
      j += 1
    end
    i -= 1
  end
  return "No common substrings"
end

def common_substrings_3(str1, str2)
  longest_substring = ""
  count = 0
  start_idx = 0
  while start_idx < str1.length
    # don't consider substrings that would be too short to beat
    # current max.
    len = longest_substring.length + 1

    while (start_idx + len) <= str1.length
      p "count: #{count += 1}"
      end_idx = start_idx + len
      substring = str1[start_idx...end_idx]
      longest_substring = substring if str2.include?(substring)

      len += 1
    end

    start_idx += 1
  end

  longest_substring
end
