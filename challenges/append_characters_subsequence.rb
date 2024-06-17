################ Instructions ################ 

# You are given two strings s and t consisting of only lowercase English letters.

# Return the minimum number of characters that need to be appended to the end of s so that t becomes a subsequence of s.

# A subsequence is a string that can be derived from another string by deleting some or no characters without changing the order of the remaining characters.


# Example 1:

# Input: s = "coaching", t = "coding"
# Output: 4
# Explanation: Append the characters "ding" to the end of s so that s = "coachingding".
# Now, t is a subsequence of s ("coachingding").
# It can be shown that appending any 3 characters to the end of s will never make t a subsequence.
# Example 2:

# Input: s = "abcde", t = "a"
# Output: 0
# Explanation: t is already a subsequence of s ("abcde").
# Example 3:

# Input: s = "z", t = "abcde"
# Output: 5
# Explanation: Append the characters "abcde" to the end of s so that s = "zabcde".
# Now, t is a subsequence of s ("zabcde").
# It can be shown that appending any 4 characters to the end of s will never make t a subsequence.

# Constraints:

# 1 <= s.length, t.length <= 105
# s and t consist only of lowercase English letters.

################ Clarification Questions ################

# -Can t have single letters scattered throughout s?

# -Preferred time and space complexity?

################ Pseudocode ################ 

# -This looks like a two pointer problem
# -I'll need to keep a pointer on s and on t
# -I run through them, and add if they are equal
# -If not, skip on s, but not t
# -At the end, take the difference because that is what I need to tack on

# -Problem:  "lbg", "g" gives me a negative number
# -It's how I set my pointers
# -I'll have to set a edge case to return a 0 if negative

################ First Attempt ################ 

def append_characters(s, t)
  i = 0
  j = 0
  until j >= t.length
      if s[i] == t[j]
          i += 1
          j += 1
      elsif i >= s.length
          i = j
          j = t.length
      else
          i += 1
      end
  end
  return 0 if (j - i) < 0
  return j - i
end

################ Alternative Solutions ################

# -Removes unnecessary logic

def append_characters(s, t)
  i = 0
  z = 0
  while i < s.size
      if s[i] == t[z]
          z += 1
      end
      i += 1
  end

  t.size - z
end