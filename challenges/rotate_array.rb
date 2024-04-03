################ Instructions ################ 

# Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

# Example 1:

# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]
# Example 2:

# Input: nums = [-1,-100,3,99], k = 2
# Output: [3,99,-1,-100]
# Explanation: 
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]

# Constraints:

# 1 <= nums.length <= 105
# -231 <= nums[i] <= 231 - 1
# 0 <= k <= 105


################ Clarification Questions ################

# - Should it still work if it wasn't integers only?

# - Preferred time and space complexity?

# - Can k be larger than the length of the arra?


################ Pseudocode ################ 

# -My first thought are push, pop, shift, and unshift
# -Possibly not time efficient, but super dev friendly
# -Actually, it's supposed to shift a certain way, so only pop and unshift
# -Should only need to save one variable
# -Looking at it some more, maybe can re-assign values by keeping indexes, but will stay with pop and unshift method

################ First Attempt ################ 

def rotate(nums, k)
  k.times do
      value = nums.pop
      nums.unshift(value)
  end
  return nums
end

# Suprisingly very time inefficient, will investigate
# However, do like how easy to follow my solution is
# Time complexity: O(n), but will scale a linearly with k


################ Alternative Solutions ################

# Really like this solution
# Space stays constant, better time complexity 

def rotate(nums, k)
  nums.rotate!(-k)
end
