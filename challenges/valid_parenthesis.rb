################ Instructions ################ 

# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Every close bracket has a corresponding open bracket of the same type.

# Example 1:

# Input: s = "()"
# Output: true
# Example 2:

# Input: s = "()[]{}"
# Output: true
# Example 3:

# Input: s = "(]"
# Output: false

# Constraints:

# 1 <= s.length <= 104
# s consists of parentheses only '()[]{}'.

################ Clarification Questions ################

# - Can the brackets be out of order?

# - Preferred space and time complexity?

# - Can the brackets be inside one another?

################ Pseudocode ################ 

# -Doesn't seem too hard
# -Will just make three variables for each type of bracket
# -If a left bracker, +1
# -If a right, -1
# -Return false if even under 1
# -Will need to have all variables be zero at the end

# -Hm, apparently brackets can't intermix
# -Also, one set can be inside another set
# -I'm chaninging my approach to a stack
# -Add the lefts to a stack, remove with rights

################ First Attempt ################ 

# -Too slow, but still O(n) time complexity

def is_valid(s)
  stack = []
  (0...s.length).each do |i|
      if s[i] == "(" || s[i] == "{" || s[i] == "["
          stack << s[i]
      elsif s[i] == ")"
          if stack[-1] == "("
              stack.pop
          else
              return false
          end
      elsif s[i] == "}"
          if stack[-1] == "{"
              stack.pop
          else
              return false
          end
      elsif s[i] == "]"
          if stack[-1] == "["
              stack.pop
          else
              return false
          end
      end
  end
  stack.empty?
end

################ Alternative Solutions ################

def is_valid(s)
  stack = []
  matching = { ')' => '(', '}' => '{', ']' => '[' }

  s.each_char do |char|
      if matching.values.include?(char)
          stack << char
      elsif matching.keys.include?(char)
          return false if stack.pop != matching[char]
      end
  end

  stack.empty?
end
