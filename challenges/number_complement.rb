################ Instructions ################ 

# The complement of an integer is the integer you get when you flip all the 0's to 1's and all the 1's to 0's in its binary representation.

# For example, The integer 5 is "101" in binary and its complement is "010" which is the integer 2.
# Given an integer num, return its complement.

# Example 1:

# Input: num = 5
# Output: 2
# Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
# Example 2:

# Input: num = 1
# Output: 0
# Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.

# Constraints:

# 1 <= num < 231


################ Clarification Questions ################

# -Can I use the built-in Ruby method .to_s?

# -Preferred space and time complexity?

# -Is bit length allowed?

################ Pseudocode ################ 

# -Shouldn't be too bad with the XOR operator
# -I'm thinking of enumerating through the binary value
# -XOR each value, then turning that into the intger

################ First Attempt  ################ 

# -O(n), but not optimal
# -Must be a built in method that works way better

def find_complement(num)
  num = num.to_s(2)
  flipped = ""
  num.each_char do |char|
      if char == "1"
          flipped << "0"
      else
          flipped << "1"
      end
  end
  return flipped.to_i(2)
end



################ Alternative Solutions ################

def find_complement(num)
  # Find the bit length of the number
  bit_length = num.bit_length
  
  # Create a mask that has the same number of bits as num, all set to 1
  mask = (1 << bit_length) - 1
  
  # XOR the number with the mask to flip its bits
  return num ^ mask
end
