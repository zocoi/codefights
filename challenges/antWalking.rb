# An ant starts at (0, 0) on an xy-coordinate plane and makes a sequence of n steps. Each step is of 1 unit length, and is directed left, right, up, or down. The direction is chosen randomly from these four options.
#
# Find the probability that after n steps the ant ends up back at (0, 0). Return this probability as an irreducible fraction as an array [numerator, denominator].
#
# Example
#
# For n = 2, the output should be
# antWalking(2) = [1, 4].
#
# Let L, R, U and D stand stand for a step to the left, right, up and down respectively.
# Thus, the possible paths the ant can travel are:
# LL, LR, LU, LD, RL, RR, RU, RD, UL, UR, UU, UD, DL, DR, DU, and DD.
# Only LR, RL, UD, and DU bring the ant back to (0, 0).
# Thus, the probability is (4 choices)/(16 total) = 1/4.

def antWalking(n)
  r = Rational((1..n).to_a.combination(n/2).to_a.size ** 2, 4**n)
  [r.numerator, r.denominator]
end
