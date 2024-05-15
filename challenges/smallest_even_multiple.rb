# ################ Instructions ################ 

# Given a positive integer n, return the smallest positive integer that is a multiple of both 2 and n.

# Example 1:

# Input: n = 5
# Output: 10
# Explanation: The smallest multiple of both 5 and 2 is 10.
# Example 2:

# Input: n = 6
# Output: 6
# Explanation: The smallest multiple of both 6 and 2 is 6. Note that a number is a multiple of itself.

# Constraints:

# 1 <= n <= 150

################ Clarification Questions ################

# -Can I use the built-in methods of odd? and even? instead of using %?

# -Preferred Time and Space Complexity?

################ Pseudocode ################ 

# -This problem seems incredibly easy, so I'm going to make sure I take care of edge cases
# -Looking at the problem, I only need to differentiate between odd or even
# -Odd: n*2
# -Even: n

################ First Attempt ################ 

def smallest_even_multiple(n)
  if n.even?
      return n
  else n.odd?
      return (2 * n)
  end
end

################ Alternative Solutions ################

# - A tiny bit more efficient, don't need the else statement (duh)

def smallest_even_multiple(n)
  if n % 2 == 0
      return n
  else
      return 2 * n
  end
end
    