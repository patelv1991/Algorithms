# Implement the Folding Cipher. It folds the alphabet in half and uses the
# adjacent letter. Ie. a <=> z, b <=> y, c <=> x, m <=> n.

def folding_cipher(str)
  idx = 0
  str.each_char do |char|
    str[idx] = ("z".ord - char.ord + "a".ord).chr
    idx += 1
  end
  str
end

def folding_cipher2(str)
  folded_alphabets = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
  str.chars.map { |chr| folded_alphabets[chr] }.join()
end
