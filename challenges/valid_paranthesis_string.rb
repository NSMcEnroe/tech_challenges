# Wrong answer. Try again after May 6th

################ Instructions ################ 

# Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.

# The following rules define a valid string:

# Any left parenthesis '(' must have a corresponding right parenthesis ')'.
# Any right parenthesis ')' must have a corresponding left parenthesis '('.
# Left parenthesis '(' must go before the corresponding right parenthesis ')'.
# '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".

# Example 1:

# Input: s = "()"
# Output: true
# Example 2:

# Input: s = "(*)"
# Output: true
# Example 3:

# Input: s = "(*))"
# Output: true

# Constraints:

# 1 <= s.length <= 100
# s[i] is '(', ')' or '*'.

################ Clarification Questions ################

# - Could I get several examples of false outputs?

# - Expected space and time complexity?

# - With a short array length, can a brute force approach be acceptable?


################ Pseudocode ################ 

-I'm thinking of having two counters, one for left and one for right
-The stars really complicate the problem though

-I could possibly use a single counter, having this value go up or down based off of the element

-Nah, I like a brute force approach better
-Time complexity will be horrible though
-Split into an array, find a left, go through until I find a right
-If I don't find a right, start another process including stars

-Hm, an array length of 1 creates a problem, will have to find an outlet for that

-I might only need one pointer with a brute force approach

-Too much logic; need to swtich approaches

-Wait, what if I approached this as a shift and pop
-Check the ends, then delete them off the array

################ First Attempt ################ 

# Submission is wrong
# Realized earlier that () could be next to each other, but got too excited on shift and pop answer

def check_valid_string(s)
  array = s.split("")
  while array.length > 1
      if (array[0] == "(" || array[0] == "*") && (array[-1] == ")" || array[-1] == "*")
          array.shift
          array.pop
      else 
          return false
      end
  end

  if array == [] || array == ["*"]
      return true
  else
      return false
  end
end


################ Alternative Solutions ################

# Had a similar idea earlier, but decided to shift.  Will study and return to this solution later
# Why is it called greedy?

def check_valid_string(s)
  # lo and hi are smallest and largest possible number of open left brackers after processing the current char in the string
  lo = 0
  hi = 0
  s.each_char do |ch|
      lo += ch == '(' ? 1 : -1
      hi += ch != ')' ? 1 : -1

      break if hi < 0

      lo = [lo, 0].max
  end
  lo == 0
end