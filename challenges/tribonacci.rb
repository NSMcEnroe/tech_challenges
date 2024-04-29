################ Instructions ################ 

# The Tribonacci sequence Tn is defined as follows: 

# T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.

# Given n, return the value of Tn.


# Example 1:

# Input: n = 4
# Output: 4
# Explanation:
# T_3 = 0 + 1 + 1 = 2
# T_4 = 1 + 1 + 2 = 4
# Example 2:

# Input: n = 25
# Output: 1389537

# Constraints:

# 0 <= n <= 37
# The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.

################ Clarification Questions ################

# - What if n is less than 3?  Should it only be the sum of n numbers?

# - Preferred time and space complexity?

# - Can I modify Fibonacci algorithms?

################ Pseudocode ################ 

# -Looks like I can just modify my fibonacci algorithm (if I can remember it correctly)
# -Hmm, tribonacci, it's slightly different
# -I think I can just store three variables
# -Then modify them as n gets bigger
# -N can only be up to 37, so shouldn't get too ridiculous for time complexity
# - AS n gets smaller, will have to modify and shift the variables


################ First Attempt ################ 

# -Works, but not efficient :(

def tribonacci(n)
  i = 0
  j = 1
  k = 1
  return i if n == 0
  return j if (n == 1 || n == 2)
  while n > 3
      k += j + i
      j = (k-j-i)
      i = (k-j-i)
      n -= 1
  end
  return (i + j + k)
end

################ Alternative Solutions ################

# -Further research suggests space complexity was fine
# -However, tuple assignments optimize time
# -Will need to work with those more

def tribonacci(n)
  return 0 if n == 0
  return 1 if n == 1 || n == 2

  i, j, k = 0, 1, 1
  (3..n).each do |_|
    i, j, k = j, k, i + j + k
  end

  k
end