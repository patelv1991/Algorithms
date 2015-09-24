# Write a method that takes a string as input. It should return true if the
# input is a valid IPv4 address (ie. anything between 0.0.0.0 and 255.255.255.255
# is valid).

def valid_ip?(str)
  str_arr = str.split(".");
  return false if str_arr.length != 4

  str_arr.each do |el|
    return false unless el.match(/^\d{0,3}$/) && el.to_i >= 0 && el.to_i <= 255
  end
  return true    
end
