###
# Given a matchstick equation, determine the number of its solutions.
# A matchstick equation consists only of decimal digits 0-9 and operators +, -, and =, represented by matchstick formations as shown in
# the picture:
# http://i.imgur.com/1FztzgL.png

# Matchstick symbols
# A matchstick equation may contain only one equality sign = and only one other operator, which will always be to the left of the equality sign. The numbers within a matchstick equation are always non-negative integers without leading zeros. Thus, all matchstick equations have the following format:
# <number> {+|-} <number> = <number>
# A solution to a matchstick equation is such a move of a single matchstick from one position in the equation to another, that after it occurs, the formation remains a valid matchstick equation and the equation it represents holds true.
# A move can result in a modification of any symbols other than the equality sign, but it cannot completely remove, add, split, or merge symbols - for example, a single 4 may not be split into two 1's, and a - sign cannot be moved elsewhere in the equation. Also, in case of the symbol 1, assume there is always sufficient space to its left to turn it into a 7.
# Example

# MatchstickSolutions("10+1=3") = 2.
# The solutions are 10-1=9 and 10-7=3.
# MatchstickSolutions("1-61=0") = 0.
# 6 can't be modified into a 0 because that would make it a leading zero.
# MatchstickSolutions("7+1=8") = 1.
# The solution is 1+7=8. Although the original equation holds true, it is not a valid solution because it's not a result of some move.
###

def MatchstickSolutions(equation)
  matchstick_positions = {
    "0" => [1,2,3,4,5,6],
    "1" => [4,5],
    "2" => [2,3,5,6,8],
    "3" => [3,4,5,6,8],
    "4" => [1,4,5,8],
    "5" => [1,3,4,6,8],
    "6" => [1,2,3,4,6,8],
    "7" => [4,5,6],
    "8" => [1,2,3,4,5,6,8],
    "9" => [1,3,4,5,6,8],
    "-" => [8],
    "+" => [8,10],
    "=" => [7,9],
  }
  
  unmodified_chars = ["1", "4", "7", "8", "-", "="]
  self_modified_chars = [["2", "3", "5"], ["0","6","9"]]

  # Method start

  count = 0
  (0...equation.size).each do |idx|
    c = equation[idx]
    # unmodified char
    if unmodified_chars.include? c
      next
    end
    # self modified char
    self_modified_chars.each do |tmp|
      if tmp.include? c
        [tmp - c].each{|new_c|
          new_eq = equation.clone
          new_eq[idx] = new_c
          if equation_correct?(new_eq)
            count = count + 1
            break
          end
        }
      end
    end
    # permutable char
    minus_chars = {
      "6": ["5"],
      "7": ["1"],
      "8": ["0", "6", "9"],
      "9": ["3", "5"],
      "+": "-",
      }
    bonus_chars = {
        "1": ["7"],
        "3": ["9"],
        "5": ["6", "9"],
        "6": ["8"],
        "9": ["8"],
        "0": ["8"],
        "-": "+"
        }
    if minus_chars.key? c
      minus_chars[c].each do |new_c|
        new_eq = equation.clone
        (new_eq.split("") - [c]).each do |other_c|
          new_eq[idx] = new_c
          if bonus_chars.key? other_c
            bonus_chars[other_c].each do |new_other_c|
              other_new_eq = new_eq.clone
              other_new_eq[other_c] = new_other_c
              if equation_correct?(new_eq)
                count = count + 1
                break
              end
            end
          end
        end
      end
    end
  end
  count
end

def equation_correct?(left, right=nil)
  if right == nil
    left, right = left.split("=")
  end
  eval(left) == right.to_i
end

puts MatchstickSolutions("10+1=3").inspect
