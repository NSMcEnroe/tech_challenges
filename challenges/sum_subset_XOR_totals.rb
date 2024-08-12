################ Instructions ################ 

# The XOR total of an array is defined as the bitwise XOR of all its elements, or 0 if the array is empty.

# For example, the XOR total of the array [2,5,6] is 2 XOR 5 XOR 6 = 1.
# Given an array nums, return the sum of all XOR totals for every subset of nums. 

# Note: Subsets with the same elements should be counted multiple times.

# An array a is a subset of an array b if a can be obtained from b by deleting some (possibly zero) elements of b.


# Example 1:

# Input: nums = [1,3]
# Output: 6
# Explanation: The 4 subsets of [1,3] are:
# - The empty subset has an XOR total of 0.
# - [1] has an XOR total of 1.
# - [3] has an XOR total of 3.
# - [1,3] has an XOR total of 1 XOR 3 = 2.
# 0 + 1 + 3 + 2 = 6
# Example 2:

# Input: nums = [5,1,6]
# Output: 28
# Explanation: The 8 subsets of [5,1,6] are:
# - The empty subset has an XOR total of 0.
# - [5] has an XOR total of 5.
# - [1] has an XOR total of 1.
# - [6] has an XOR total of 6.
# - [5,1] has an XOR total of 5 XOR 1 = 4.
# - [5,6] has an XOR total of 5 XOR 6 = 3.
# - [1,6] has an XOR total of 1 XOR 6 = 7.
# - [5,1,6] has an XOR total of 5 XOR 1 XOR 6 = 2.
# 0 + 5 + 1 + 6 + 4 + 3 + 7 + 2 = 28
# Example 3:

# Input: nums = [3,4,5,6,7,8]
# Output: 480
# Explanation: The sum of all XOR totals for every subset is 480.


################ Clarification Questions ################

# -Am I allowed to use the built in combination method?

# -Preferred space and time complexity?

################ Pseudocode ################ 

# -Without the combination method in Ruby this might be very tricky
# -However, I can create all subsets using .combination(i).to_a
# -Afterwards, I will need to enumerate through each subset using the xor operator
# -Want to create a temp sum
# -Then add that to the real sum

################ First Attempt ################ 

# -Alright space and time complexity

def subset_xor_sum(nums)
  subsets = []
  (0..nums.length).each do |i|
      subsets = subsets + nums.combination(i).to_a
  end
  answer = 0
  subsets.each do |sub|
      temp = 0
      (0...sub.length).each do |i|
          temp ^= sub[i]
      end
      answer += temp
  end
  return answer
end


################ Alternative Solutions ################

# -What tripped me up was the addition aspect
# -However, more efficient

class Solution
  def subset_xor_sum(nums)
    helper(nums, 0, 0)
  end

  private

  def helper(nums, index, curr_value)
    return curr_value if index == nums.length

    helper(nums, index + 1, curr_value ^ nums[index]) + helper(nums, index + 1, curr_value)
  end
end