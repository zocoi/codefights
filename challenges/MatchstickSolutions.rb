###
# Given a matchstick eq, determine the number of its solutions.
# A matchstick eq consists only of decimal digits 0-9 and operators +, -, and =, represented by matchstick formations as shown in
# the picture:
# http://i.imgur.com/1FztzgL.png

# Matchstick symbols
# A matchstick eq may contain only one equality sign = and only one other operator, which will always be to the l of the equality sign. The numbers within a matchstick eq are always non-negative integers without leading zeros. Thus, all matchstick eqs have the following format:
# <number> {+|-} <number> = <number>
# A solution to a matchstick eq is such a move of a single matchstick from one position in the eq to another, that after it occurs, the formation remains a valid matchstick eq and the eq it represents holds true.
# A move can result in a modification of any symbols other than the equality sign, but it cannot completely remove, add, split, or merge symbols - for example, a single 4 may not be split into two 1's, and a - sign cannot be moved elsewhere in the eq. Also, in case of the symbol 1, assume there is always sufficient space to its l to turn it into a 7.
# Example

# MatchstickSolutions("10+1=3") = 2.
# The solutions are 10-1=9 and 10-7=3.
# MatchstickSolutions("1-61=0") = 0.
# 6 can't be modified into a 0 because that would make it a leading zero.
# MatchstickSolutions("7+1=8") = 1.
# The solution is 1+7=8. Although the original eq holds true, it is not a valid solution because it's not a result of some move.
###

def MatchstickSolutions(eq)
  unmodified_chars = ["1", "4", "-", "="]
  self_modified_chars = [["2", "3", "5"], ["0","6","9"]]

  # Method start
  count = 0
  (0...eq.size).each do |i|
    c = eq[i]

    # unmodified char
    next if unmodified_chars.include? c

    # self modified char
    self_modified_chars.each do |tmp|
      if tmp.include? c
        (tmp - [c]).each{|new_c|
          new_eq = eq.clone
          new_eq[i] = new_c
          next if new_c == "0" && ["+", "-"].include?(new_eq[i-1])
          if eq_correct?(new_eq)
            count += 1
            break
          end
        }
      end
    end
    # permutable char
    minus_chars = {
      "6" => ["5"],
      "7" => ["1"],
      "8" => ["0", "6", "9"],
      "9" => ["3", "5"],
      "+" => ["-"],
      }
    bonus_chars = {
        "1" => ["7"],
        "3" => ["9"],
        "5" => ["6", "9"],
        "6" => ["8"],
        "9" => ["8"],
        "0" => ["8"],
        "-" => ["+"]
        }
    next unless minus_chars.key? c
    minus_chars[c].each do |new_c|
      new_eq = eq.clone
      (0...new_eq.size).each do |other_i|
        next if other_i == i
        bonus_c = new_eq[other_i]
        new_eq[i] = new_c
        if bonus_chars.key? bonus_c
          bonus_chars[bonus_c].each do |new_bonus_c|
            other_new_eq = new_eq.clone
            other_new_eq[other_i] = new_bonus_c
            next if new_c == "0" && ["+", "-"].include?(new_eq[other_i-1])
            if eq_correct?(other_new_eq)
              count += 1
              break
            end
          end
        end
      end
    end
  end
  count
end

def eq_correct?(e)
  l, r = e.split("=")
  begin
    eval(l) == r.to_i
  rescue Exception => e
    false
  end
end