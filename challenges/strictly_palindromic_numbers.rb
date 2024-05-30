################ Instructions ################ 

# An integer n is strictly palindromic if, for every base b between 2 and n - 2 (inclusive), the string representation of the integer n in base b is palindromic.

# Given an integer n, return true if n is strictly palindromic and false otherwise.

# A string is palindromic if it reads the same forward and backward.


# Example 1:

# Input: n = 9
# Output: false
# Explanation: In base 2: 9 = 1001 (base 2), which is palindromic.
# In base 3: 9 = 100 (base 3), which is not palindromic.
# Therefore, 9 is not strictly palindromic so we return false.
# Note that in bases 4, 5, 6, and 7, n = 9 is also not palindromic.
# Example 2:

# Input: n = 4
# Output: false
# Explanation: We only consider base 2: 4 = 100 (base 2), which is not palindromic.
# Therefore, we return false.


# Constraints:

# 4 <= n <= 105


################ Clarification Questions ################

# -When they refer to base 2, is that binary?

# -Preferred Time and Space Complexity?

# -Based on the mininimum constraint of n = 4, is n-2 so that there are no weird edge cases?

################ Pseudocode ################ 

# -I'll have to do some quick research on binary numbers
# -Luckily, there is a built in Ruby method to convert to binary
# -I'll need a loop 
# -Running though the range from 2 .. n-2, I'll just return false if any of the numbers aren't palindromic

# -I do think there might be ways to shortcut this, I'll work on that after first submission

################ First Attempt ################ 

-Terrible runtime

def is_strictly_palindromic(n)
  (2..(n-2)).each do |number|
      temp = n.to_s(number)
      if temp != temp.reverse
          return false
      end
  end
  return true
end

################ Alternative Solutions ################

# -On a hunch, I kept on researching what the base means
# -Since 4 doesn't work, as well as 5 - 8 (and the example), I made the assumption none would work
# -I was correct

def is_strictly_palindromic(n)
    return false
end
