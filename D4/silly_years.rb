# Write a function that takes a year (four digit integer) and returns an array
# with the 10 closest subsequent years that meet the following condition: the
# first two digits summed with the last two digits are equal to the middle two
# digits. E.g.,
#
# 1978 => 19 + 78 = 97
# 2307 => 23 + 07 = 30

def silly_years(year)
  years = []

  until years.length == 10 || year > 9999
    years << year if helper(year)
    year += 1
  end
  years
end

def helper(year)
  year = year.to_s

  first_two = year[0..1].to_i
  last_two = year[2..3].to_i
  middle_two = year[1..2].to_i

  first_two + last_two == middle_two
end
