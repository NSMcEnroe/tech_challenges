################ Instructions ################ 

# Given an integer array nums that does not contain any zeros, find the largest positive integer k such that -k also exists in the array.

# Return the positive integer k. If there is no such integer, return -1.


# Example 1:

# Input: nums = [-1,2,-3,3]
# Output: 3
# Explanation: 3 is the only valid k we can find in the array.
# Example 2:

# Input: nums = [-1,10,6,7,-7,1]
# Output: 7
# Explanation: Both 1 and 7 have their corresponding negative values in the array. 7 has a larger value.
# Example 3:

# Input: nums = [-10,8,6,7,-2,-3]
# Output: -1
# Explanation: There is no a single valid k, we return -1.

# Constraints:

# 1 <= nums.length <= 1000
# -1000 <= nums[i] <= 1000
# nums[i] != 0

################ Clarification Questions ################

# -Am I allowed to use the Ruby Built-in method Sort?

# -Preferred time and space complexity?

# -Can the array contain repeats?


################ Pseudocode ################ 

# -I feel like I have to use a sort to speed up the solving process
# -However, that includes a quick sort O(n * log n)
# -With a counter I can run through the array, and check if the negative verstion exists
# -Retun when hit
# -Problem is, I'll also run through any positive values, which is worthless for my solution

################ First Attempt ################ 

# -I feel there is a way to maximize average run time, or remove the sort, but I don't see it

def find_max_k(nums)
  nums.sort!
  i = 0
  while i < nums.length
      if nums.include?(-(nums[i]))
          return -(nums[i])
      else 
          i += 1
      end
  end
  return -1
end

################ Alternative Solutions ################

# -It's perfect
# -Use the variable as a store, and just run through to see if there's a negative and it's greater than

def find_max_k(nums)
  k = -1
  nums.each do |i|
      if nums.include?(i * -1)
          k = i if k < i
      end
  end
  k
end