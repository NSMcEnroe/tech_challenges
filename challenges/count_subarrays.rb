################ Instructions ################ 

# You are given an integer array nums and a positive integer k.

# Return the number of subarrays where the maximum element of nums appears at least k times in that subarray.

# A subarray is a contiguous sequence of elements within an array.

 

# Example 1:

# Input: nums = [1,3,2,3,3], k = 2
# Output: 6
# Explanation: The subarrays that contain the element 3 at least 2 times are: [1,3,2,3], [1,3,2,3,3], [3,2,3], [3,2,3,3], [2,3,3] and [3,3].
# Example 2:

# Input: nums = [1,4,2,1], k = 3
# Output: 0
# Explanation: No subarray contains the element 4 at least 3 times.
 

# Constraints:

# 1 <= nums.length <= 105
# 1 <= nums[i] <= 106
# 1 <= k <= 105


################ Clarification Questions ################

# 1) Which built in Ruby methods am I allowed to use?

# 2) Is time or space complexity a major concern?

# 3) Is there a solution faster than O(n^2)?


################ Pseudocode ################ 

# -I definitely will want to use the permutation method in Ruby
# -First I'll want to check the max value in the array
# -Afterwards, check if it even shows up k amount of time (saves time for a false case)
# -Enumerable checking if the new arrays contain the k amount (use a counter)

# -Correction, I assumed there were permutations
# -By subarray, we're just splitting up the bigger array
# -We'll need two pointers, counting everytime the element shows up that amount of times

################ First Attempt ################ 





################ Second Attempt ################ 



################ Alternative Solutions ################