################ Instructions ################ 

# You are given a string word containing lowercase English letters.

# Telephone keypads have keys mapped with distinct collections of lowercase English letters, which can be used to form words by pushing them. For example, the key 2 is mapped with ["a","b","c"], we need to push the key one time to type "a", two times to type "b", and three times to type "c" .

# It is allowed to remap the keys numbered 2 to 9 to distinct collections of letters. The keys can be remapped to any amount of letters, but each letter must be mapped to exactly one key. You need to find the minimum number of times the keys will be pushed to type the string word.

# Return the minimum number of pushes needed to type word after remapping the keys.

# An example mapping of letters to keys on a telephone keypad is given below. Note that 1, *, #, and 0 do not map to any letters.


# Example 1:


# Input: word = "abcde"
# Output: 5
# Explanation: The remapped keypad given in the image provides the minimum cost.
# "a" -> one push on key 2
# "b" -> one push on key 3
# "c" -> one push on key 4
# "d" -> one push on key 5
# "e" -> one push on key 6
# Total cost is 1 + 1 + 1 + 1 + 1 = 5.
# It can be shown that no other mapping can provide a lower cost.
# Example 2:


# Input: word = "xyzxyzxyzxyz"
# Output: 12
# Explanation: The remapped keypad given in the image provides the minimum cost.
# "x" -> one push on key 2
# "y" -> one push on key 3
# "z" -> one push on key 4
# Total cost is 1 * 4 + 1 * 4 + 1 * 4 = 12
# It can be shown that no other mapping can provide a lower cost.
# Note that the key 9 is not mapped to any letter: it is not necessary to map letters to every key, but to map all the letters.
# Example 3:


# Input: word = "aabbccddeeffgghhiiiiii"
# Output: 24
# Explanation: The remapped keypad given in the image provides the minimum cost.
# "a" -> one push on key 2
# "b" -> one push on key 3
# "c" -> one push on key 4
# "d" -> one push on key 5
# "e" -> one push on key 6
# "f" -> one push on key 7
# "g" -> one push on key 8
# "h" -> two pushes on key 9
# "i" -> one push on key 9
# Total cost is 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 2 * 2 + 6 * 1 = 24.
# It can be shown that no other mapping can provide a lower cost.

# Constraints:

# 1 <= word.length <= 105
# word consists of lowercase English letters.

################ Clarification Questions ################

# -Preferred space and time complexity?

# -Does the idea of a phone booth even matter?  Optimal seems to be an even spread of values.

################ Pseudocode ################ 

# -I feel like the idea of a phone makes this question harder
# -An even spread would be Optimal
# -Therefore, Im thinking a hashmap to keep track of frequencies
# -Afterwards, sort by values
# -Run through the sorted values, and multiply the frequency at certain milestones

################ First Attempt ################ 

# -Fine for both space and time complexity
# -Does seem to vary wildly for space for each submission

def minimum_pushes(word)
  tol = Hash.new(0)
  word.each_char do |char|
      tol[char] += 1
  end
  sorted_count = tol.values.sort.reverse
  answer = 0
  (0...sorted_count.length).each do |i|
      if i < 8
          answer += sorted_count[i]
      elsif i < 16
          answer += (sorted_count[i] * 2)
      elsif i < 24
          answer += (sorted_count[i] * 3)
      else
          answer += (sorted_count[i] * 4)
      end
  end
  return answer 
end

################ Alternative Solutions ################

def minimum_pushes(word)
  h = Hash.new
  word.each_char do |l|
      h[l] ||= 0
      h[l] += 1
  end

  count = 1
  multiplyer = 1
  sum = 0
  h.values.sort.reverse.each do |i|
      sum += i * multiplyer

      multiplyer += 1 if count%8 == 0
      count += 1
  end

  sum
end