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

# -I'm thinking of having two counters, one for left and one for right
# -The stars really complicate the problem though

# -I could possibly use a single counter, having this value go up or down based off of the element

# -Nah, I like a brute force approach better
# -Time complexity will be horrible though
# -Split into an array, find a left, go through until I find a right
# -If I don't find a right, start another process including stars

# -Hm, an array length of 1 creates a problem, will have to find an outlet for that

# -I might only need one pointer with a brute force approach

# -Too much logic; need to swtich approaches

# -Wait, what if I approached this as a shift and pop
# -Check the ends, then delete them off the array

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


################ Second Attempt ################ 

# -Try to do a two-pointer approach
# -My focus is on making sure from the left we have a left or a star
# -And from the right, a right and a star
# -Doesn't check for inner ()

# -Switch to an enumerable
# -Count lefts, rights, and stars
# -Have checks making sure the left + stars can account for rights
# -Hmm, problem is doesn't account for location

# -I keep on doing different approaches, but they have the same logic
# -I need to account for locations
# -I'm going back to two pointer approach

# -I see what my original problem is
# -I need to run through the entire array from both sides
# -That way, it accounts there's enough rights for the lefts, and lefts for the rights

# -Not great for space or time complexity though

def check_valid_string(s)
    front = 0
    back = 0
    i = 0
    j = s.length - 1
    until i >= s.length
        if s[i] == "(" || s[i] == "*"
            front += 1
        else
            front -= 1
        end
        if s[j] == ")" || s[j] == "*"
            back += 1
        else
            back -= 1
        end
        if back < 0 || front < 0
            return false
        end
        i += 1
        j -= 1
    end
    return true
end


################ Alternative Solutions ################

# Had a similar idea earlier, but decided to shift.  Will study and return to this solution later
# Why is it called greedy?

# -I see why this one works
# -It has the same apporach as mine, but keeps it in variables
# -Lo checks for enough rights, and Hi checks that lefts don't dominate the end
# -Whoops, it's reversed. Lo is checking for appropriate right par.

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