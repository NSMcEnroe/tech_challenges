# Preface: Attempted this problem two months ago

################ Instructions ################ 

# You are given a string s, which contains stars *.

# In one operation, you can:

# Choose a star in s.
# Remove the closest non-star character to its left, as well as remove the star itself.
# Return the string after all stars have been removed.

# Note:

# The input will be generated such that the operation is always possible.
# It can be shown that the resulting string will always be unique.

# Example 1:

# Input: s = "leet**cod*e"
# Output: "lecoe"
# Explanation: Performing the removals from left to right:
# - The closest character to the 1st star is 't' in "leet**cod*e". s becomes "lee*cod*e".
# - The closest character to the 2nd star is 'e' in "lee*cod*e". s becomes "lecod*e".
# - The closest character to the 3rd star is 'd' in "lecod*e". s becomes "lecoe".
# There are no more stars, so we return "lecoe".
# Example 2:

# Input: s = "erase*****"
# Output: ""
# Explanation: The entire string is removed, so we return an empty string.

# Constraints:

# 1 <= s.length <= 105
# s consists of lowercase English letters and stars *.
# The operation above can be performed on s.

################ Clarification Questions ################

# - Will there be a character always in front of a star?

# - Should it work even if there are no stars?

# - What if there are more stars than removable characters?


################ Pseudocode ################ 

# -Don't quite remember how I tried to solve this last time
# -I'm thinking enumerate through, and delete based off the index
# -Doesn't seem to quite work, due to double stars
# -Probably what I tried last time

# -OHHHHH, it's a stack problem
# -enumerate through the string
# -if star, remove the last char
# -if not, add it to the answer string

################ Second Attempt ################ 

def remove_stars(s)
  answer = ""
  s.each_char do |char|
    if char == "*"
      answer.chop!
    else
      answer << char
    end
  end
  return answer
end

################ Alternative Solutions ################

# Interesting, converting the stack to an array actually makes it more time efficient
# Must be something under the hood

def remove_stars(s)
  stack = []
  s.each_char do |char|
    if char == '*'
      stack.pop unless stack.empty?
    else
      stack.push(char)
    end
  end
  stack.join
end


