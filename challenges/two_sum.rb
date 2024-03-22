# Challenge #1 on LeetCode
# Showed up during an interview at Alpha Omega and on various interview prep videos

################ Instructions ################ 

# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:

# Input: nums = [3,3], target = 6
# Output: [0,1]

# Constraints:

# 2 <= nums.length <= 104
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only one valid answer exists.

################ Clarification Questions ################

# 1) Based on the constraints, all elements in an array need to be unique, and the target will always produce a non null answer.

# 2) Due to the (seemingly) infinite length of nums, time complexity seems to be a major factor.

# 3) Positive and negatives can be used within nums, but that shouldn't affect too much.

################ Pseudocode ################ 

# Note: This can easily be done with a O(n^2) time complexity with a few pointers.
# However, due to seeing videos focused on hashes, I know I can create a hash with used numbers, allowing the problem to be solved in an O(n) time complexity.
# I'll need to create a new empty hash, as well as a counter to keep up where I'm in the nums array.
# I'm thinking the hash should have a key of the nums value, and the value should be the position.
# Eventually I'll need to create a difference variable.
# Running through I'll take the target - current nums value;
# if the difference is present in the seen numbers hash, I have my pair.

################ First Attempt ################ 

def two_sum(nums, target)
  previous = Hash.new(0)
  i = 0
  previous[nums[i]] = i
  until i == nums.length
      i += 1
      difference = target - nums[i]
      break if previous.include?(difference)
      previous[nums[i]] = i
  end
  return [i, previous[difference]]
end

################ Alternative Solutions ################

def two_sum(nums, target)
  previous = {}
  nums.each_with_index do |num, i|
    complement = target - num
    if previous.key?(complement)
      return [previous[complement], i]
    end
    previous[num] = i
  end
end

# each_with_index is more efficient