################ Instructions ################ 

# Given a non-negative integer c, decide whether there're two integers a and b such that a2 + b2 = c.

# Example 1:

# Input: c = 5
# Output: true
# Explanation: 1 * 1 + 2 * 2 = 5
# Example 2:

# Input: c = 3
# Output: false

# Constraints:

# 0 <= c <= 231 - 1


################ Clarification Questions ################

# -Is 0 considered an integer?

# -Preferred time and space complexity?

# -Can a and b be the same value?

################ Pseudocode ################ 

# -Failed the first time seeing this problem
# -Need to manipulate the formula to get b
# -b = sqrt(c-(a*a))
# -Under a until loop, will need to check if the formula works
# -Run it until hitting a condition
# -If the until loop runs out, return false
# -Will also need to round down, since math class is a float

# -Messed up the until loop
# -Should be to check if the sqrt is greater than 0

# -Ugh, forgot 0 is considered an integer


################ First Attempt ################ 

# -Better than average time and space complexity

def judge_square_sum(c)
  return true if c == 0
  a = 1
  b = 0
  until (c-(a*a)) < 0
      b = Math.sqrt(c-(a*a)).floor
      if ((a*a) + (b*b) == c)
          return true
      end
      a += 1
  end
  return false
end


################ Alternative Solutions ################

# -Two pointer solution

def judge_square_sum(c)
  return true if c == 0
  a = 0
  b = Math.sqrt(c).floor
  
  while a <= b
      sum_of_squares = a * a + b * b
      if sum_of_squares == c
          return true
      elsif sum_of_squares < c
          a += 1
      else
          b -= 1
      end
  end
  return false
end