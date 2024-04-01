################ Instructions ################ 

# Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.

# You must write an algorithm that runs in O(n) time and uses only constant extra space.

# Example 1:

# Input: nums = [4,3,2,7,8,2,3,1]
# Output: [2,3]
# Example 2:

# Input: nums = [1,1,2]
# Output: [1]
# Example 3:

# Input: nums = [1]
# Output: []

# Constraints:

# n == nums.length
# 1 <= n <= 105
# 1 <= nums[i] <= n
# Each element in nums appears once or twice.

################ Clarification Questions ################

# 1) I want to clairfy what the problem means by constant extra space.  Would nums still be modifiable?

# 2) Can I sort it first before adhering to the O(n) requirement?

# 3) Will n = numbers.length come into play with the solution?

################ Pseudocode ################ 

# -I would really like to quicksort it, but I dont believe that is the intent of this problem
# -Thinking hash map
# -After hashmap creation, check which values are 2, and replace nums with those values
# -that way, the hashmap is the only thing created
# -I'll check later if that falls within constant extra space
# -Will fall under O(n), technically O(2n)


################ First Attempt ################ 


################ Second Attempt ################ 



################ Alternative Solutions ################

