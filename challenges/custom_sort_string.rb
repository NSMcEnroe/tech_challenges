# ################ Instructions ################ 

# You are given two strings order and s. All the characters of order are unique and were sorted in some custom order previously.

# Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.

# Return any permutation of s that satisfies this property.


# Example 1:

# Input: order = "cba", s = "abcd"

# Output: "cbad"

# Explanation: "a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a".

# Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.

# Example 2:

# Input: order = "bcafg", s = "abcd"

# Output: "bcad"

# Explanation: The characters "b", "c", and "a" from order dictate the order for the characters in s. The character "d" in s does not appear in order, so its position is flexible.

# Following the order of appearance in order, "b", "c", and "a" from s should be arranged as "b", "c", "a". "d" can be placed at any position since it's not in order. The output "bcad" correctly follows this rule. Other arrangements like "bacd" or "bcda" would also be valid, as long as "b", "c", "a" maintain their order.


# Constraints:

# 1 <= order.length <= 26
# 1 <= s.length <= 200
# order and s consist of lowercase English letters.
# All the characters of order are unique.


################ Clarification Questions ################

# -Can there be repeat letters in s?

# -Preferred time and space complexity?

# -Can I introduce a hash key?

################ Pseudocode ################ 

# -During my first attempt, I tried to trear order and s similarly
# -I switched them to individual character strings, and compared the two
# -However, it fundamentally missed the point of the Questions

# -Now, I'll start with a hash, keeping track of the values of each character
# -Afterwards, run through order
# -If order character shows up in s, put all of those letters in the answer
# -After running through order, just append the rest of s

################ Second Attempt ################ 

# -Not great at time and space efficiency?

def custom_sort_string(order, s)
  i = 0
  s_hash = s.split("").tally
  answer = ""
  until i == order.length
      if !s_hash.key?(order[i])
          i += 1
      else 
          until s_hash[order[i]] == 0
              answer << order[i]
              s_hash[order[i]] -= 1
          end
          i += 1
      end
  end
  s_hash.keys.each do |letter|
      next if s_hash[letter] == 0
      until s_hash[letter] == 0
          answer << letter
          s_hash[letter] -= 1
      end
  end
  return answer
end

################ Alternative Solutions ################

# -Removes the singular steps, opting for adding all characters at the same time each step

def custom_sort_string(order, s)
  # Step 1: Count the occurrences of each character in s
  s_hash = Hash.new(0)
  s.each_char { |char| s_hash[char] += 1 }

  # Step 2: Build the result string based on the order
  answer = ""
  order.each_char do |char|
    if s_hash.key?(char)
      answer << char * s_hash[char]
      s_hash.delete(char)
    end
  end

  # Step 3: Append remaining characters in s
  s_hash.each do |char, count|
    answer << char * count
  end

  return answer
end