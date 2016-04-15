###
# You are given a positive integer n either as a number, or in the format "a^b", where a and b are positive integers (possibly with leading zeros).
#
# Your task is to sum all digits in n. Repeat the process until you get a single digit and return it.
#
# Example
#
# tillsingle("4444") = 7
# 4444 => 4 + 4 + 4 + 4 = 16
# 16 => 1 + 6 = 7
# tillsingle("2^9") = 8
# 29 = 512
# 512 => 5 + 1 + 2 = 8


def tillsingle(n)
  n, p = n.split("^")
  p ||= 1
  ds (n.to_i**p.to_i).to_s
end

def ds(n)
  return n.to_i if n.size == 1
  ds(n.split("").map(&:to_i).inject(:+).to_s)
end