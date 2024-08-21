################ Instructions ################ 

# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

# Constraints:

# 1 <= strs.length <= 200
# 0 <= strs[i].length <= 200
# strs[i] consists of only lowercase English letters.

################ Clarification Questions ################

# -Which approach is better: horizontal or vertical matching?

# -Preferred space and time complexity?

################ Pseudocode ################ 

# - I think I will approach this letter by letter for each word
# -Starting with the first letter of the first word, I'll compare that to all the first letters of the other words
# -Stop when I find a mismatch
# -Should only need an until with enumerables inside, but most likely will hit a break first

################ First Attempt ################ 

def longest_common_prefix(strs)
    i = 0
    current = strs[0][0]
    answer = ""
    until i >= strs[0].length
        strs.each do |word|
            if current != word[i]
                return answer
            end
        end
        answer << current
        i += 1
        current = strs[0][i]
    end
    return answer
end

################ Alternative Solutions ################

# -Intresting way to store and compare the word

def longest_common_prefix(strs)
  prefix = strs[0]

  strs.each do |word|
      while word.index(prefix) != 0
          prefix = prefix[0...-1]
          return "" if prefix.empty?
      end
  end

  return prefix
end