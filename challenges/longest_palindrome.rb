################ Instructions ################ 

# Given a string s which consists of lowercase or uppercase letters, return the length of the longest 
# palindrome that can be built with those letters.

# Letters are case sensitive, for example, "Aa" is not considered a palindrome.


# Example 1:

# Input: s = "abccccdd"
# Output: 7
# Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
# Example 2:

# Input: s = "a"
# Output: 1
# Explanation: The longest palindrome that can be built is "a", whose length is 1.

# Constraints:

# 1 <= s.length <= 2000
# s consists of lowercase and/or uppercase English letters only.

################ Clarification Questions ################

# -Would a greedy algorithm be preferred?

# -Preferred time and space complexity?


################ Pseudocode ################ 

# -A hashmap is my first guess
# -I can tally all the occurrences of each letters
# -Evens can automatically be added, since they will be fine for palindromes
# -Odds can be used, but I have to subtract One
# -Lastly, a single odd letter out can be used

################ First Attempt ################ 

# -Terrible time and space complexity

def longest_palindrome(s)
  count = s.split("").tally
  answer = 0
  used = false
  count.each do |_,v|
      if v.even?
          answer += v
      elsif v.odd? && used == false
          answer += v
          used = true
      else 
          answer += (v-1)
      end
  end
  return answer
end

################ Alternative Solutions ################

# -Streamlines my answer
# -Accounts for the odd center only once

def longest_palindrome(s)
  sum = 0
  s.chars.tally.values.each do |v|
    sum += v / 2 * 2
    sum += 1 if sum.even? && v.odd?
  end
  sum
end