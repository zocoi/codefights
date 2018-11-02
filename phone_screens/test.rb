# list of employee

# fill as many as to the group 5
# do same for the remaining
# if last group < 3
# steal 1 or 2 from prev group 5

def generate_groups(employees = [])
  if employees.size < 3
    return []
  end
  groups = []
  group = []
  while !employees.empty?
    group << employees.shift
    if group.size == 5
      groups << group
      group = []
    end
  end
  # group # remaining
  # pp groups, group
  unless group.size == 0
    need_to_fill = 3 - group.size
    filled = 0
    index = 0
    while filled < need_to_fill && index < groups.size
      while groups[index].size > 3
        group << groups[index].pop
        filled += 1
      end
      index += 1
    end
    # pp [groups, group, filled, index, need_to_fill]
    groups << group
  end

  # pp groups
  groups
end


pp "Test case 1"
# [1,2,3,4,5]
# [[1,2,3,4,5]]
pp generate_groups([1,2,3,4,5])

pp "Test case 2"
# [1,2,3,4,5,6]
# [[1,2,3], [4,5,6]]
pp "WARNING!!!"
pp generate_groups([1,2,3,4,5,6])

pp "Test case 3"
# [1,2]
# []
pp generate_groups([1,2])

pp "Test case 3.1"
# []
# []
pp generate_groups([]) # []

pp "Test case 4"
# [1,2,3,4,5,6,7]
# [[1,2,3], [4,5,6,7]]
pp generate_groups([1,2,3,4,5,6,7])

pp "Test case 5"
# 25 employees
# ....
pp generate_groups((1..25).to_a)
pp generate_groups((1..26).to_a)
# such n which n % 5 < 3 || n % 3 < 3
