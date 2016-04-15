###
# In our conventional number system, every number can be represented by a combination of 10 digits, 0 ... 9. It's called a base-10, or decimal number system. However, other number systems exist as well. For example, two of the most common of these alternate systems are binary (base-2) and hexadecimal (base-16), both of which you should be familiar with.
#
# In this task, your goal is to convert the given number n from base-10 to base-20 (the vigesimal number system). The following is a table of digit conversions between the two systems. In this system, digits from 0 to 9 are represented the same digits as in the decimal number system, and digits from 10 to 19 are represented by symbols from 'A' to 'J' respectively.
#
# Example
#
# Base20(30) = "1A"
# Base20(192) = "9C"
# Base20(20) = "10"

def Base20(n)
  n.to_s(20).upcase
end
