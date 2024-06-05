################ Instructions ################ 

# You are given two strings s and t of the same length and an integer maxCost.

# You want to change s to t. Changing the ith character of s to ith character of t costs |s[i] - t[i]| (i.e., the absolute difference between the ASCII values of the characters).

# Return the maximum length of a substring of s that can be changed to be the same as the corresponding substring of t with a cost less than or equal to maxCost. If there is no substring from s that can be changed to its corresponding substring from t, return 0.


# Example 1:

# Input: s = "abcd", t = "bcdf", maxCost = 3
# Output: 3
# Explanation: "abc" of s can change to "bcd".
# That costs 3, so the maximum length is 3.
# Example 2:

# Input: s = "abcd", t = "cdef", maxCost = 3
# Output: 1
# Explanation: Each character in s costs 2 to change to character in t,  so the maximum length is 1.
# Example 3:

# Input: s = "abcd", t = "acde", maxCost = 0
# Output: 1
# Explanation: You cannot make any change, so the maximum length is 1.

# Constraints:

# 1 <= s.length <= 105
# t.length == s.length
# 0 <= maxCost <= 106
# s and t consist of only lowercase English letters.

################ Clarification Questions ################

# -Am I allowed to use .ord to calculate the difference between ASCII values?

# -Preferred time and space complexity?

# -Can I use absolute values for the difference?

################ Pseudocode ################ 

# -It looks like I will need to stop my calculations when the value gets too high
# -This isn't efficient, but I could just save all of the values for the entire string
# -Next, I'll run through that array
# -Once my max cost is hit, I stop
# -Will need to make an edge case for values.length being 1

################ First Attempt ################ 

# -Not great with memory, I probably could have use a each_with_index to save on variables

def equal_substring(s, t, max_cost)
  i = 0
  values = []
  until i >= s.length
      values << (s[i].ord - t[i].ord).abs
      i += 1
  end
  return 1 if (values.length == 1 && values[0] <= max_cost)
  i = 0
  j = 0
  sum = 0
  until j >= s.length
      sum += values[j]
      if sum > max_cost
          sum -= values[i]
          i += 1
      end
      j += 1
  end 
  return (j - i)
end

################ Alternative Solutions ################

def equal_substring(s, t, max_cost)
  acc = 0
  max_length = 0 
  left = right = 0
  s = s.bytes
  t = t.bytes

  while right < s.length
    curr_cost = (t[right] - s[right]).abs
    acc += curr_cost
    while left <= right && acc > max_cost
       acc -= (t[left] - s[left]).abs 
       left += 1
    end 
    max_length = max_length > (right - left + 1) ? max_length : right - left + 1
    right += 1
  end

  max_length
end