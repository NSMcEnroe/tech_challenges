################ Instructions ################ 

# Given a 0-indexed string word and a character ch, reverse the segment of word that starts at index 0 and ends at the index of the first occurrence of ch (inclusive). If the character ch does not exist in word, do nothing.

#   For example, if word = "abcdefd" and ch = "d", then you should reverse the segment that starts at 0 and ends at 3 (inclusive). The resulting string will be "dcbaefd".
#   Return the resulting string.
  
  
#   Example 1:
  
#   Input: word = "abcdefd", ch = "d"
#   Output: "dcbaefd"
#   Explanation: The first occurrence of "d" is at index 3. 
#   Reverse the part of word from 0 to 3 (inclusive), the resulting string is "dcbaefd".
#   Example 2:
  
#   Input: word = "xyxzxe", ch = "z"
#   Output: "zxyxxe"
#   Explanation: The first and only occurrence of "z" is at index 3.
#   Reverse the part of word from 0 to 3 (inclusive), the resulting string is "zxyxxe".
#   Example 3:
  
#   Input: word = "abcd", ch = "z"
#   Output: "abcd"
#   Explanation: "z" does not exist in word.
#   You should not do any reverse operation, the resulting string is "abcd".
  
#   Constraints:
  
#   1 <= word.length <= 250
#   word consists of lowercase English letters.
#   ch is a lowercase English letter.

################ Clarification Questions ################


# - Can I turn the string into an array?

# - Preferred time and space complexity?

# - Can I use the bult-in Ruby method reverse?


################ Pseudocode ################ 

# -I'm thinking I can create a stack(?)
# -Not technically a stack, since I wont remove anything
# -Once I see ch, reverse answer, then fill in the rest of the letters
# -Don't see it, just reverse at the end

################ First Attempt ################ 

# -Great with runtime, not good with memory

def reverse_prefix(word, ch)
  answer = []
  reverse = false
  i = 0
  word = word.split("")
  until i > word.length
      if reverse == false
          answer.unshift(word[i])
          if (word[i] == ch) && !(i == word.length)
              reverse = true
          end
      else
          answer.push(word[i])
      end
      i += 1
  end
  if reverse == false
      answer.reverse!
  end
  return answer.join("")
end

################ Alternative Solutions ################

def reverse_prefix(word, ch)
  left = 0
  right = word.index(ch)
  return word if right.nil?
  
  arr = word.chars
  
  while left < right
      arr[left], arr[right] = arr[right], arr[left]
      left += 1
      right -= 1
  end
  
  arr.join
end