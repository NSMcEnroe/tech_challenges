# - Note: Not Completed

################ Instructions ################ 

# Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

# Example 1:

# Input: nums = [0,1]
# Output: 2
# Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
# Example 2:

# Input: nums = [0,1,0]
# Output: 2
# Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.

# Constraints:

# 1 <= nums.length <= 105
# nums[i] is either 0 or 1.

################ Clarification Questions ################

# -Can I modify the values?

# -Preferred space and time complexity?

################ Pseudocode ################ 

# -My first thought is to have a pointer at the beginning and end
# -Sum up the values, and find an average
# -Remove 0's and 1's depending on average
# -However, might choose the wrong end
# -Don't want to start in the middle with two by finding a 0 and 1
# -Especially since the length could be huge

################ First Attempt (March 2024) ################ 

# - Not only confusing, but I'm pretty sure this solution is completely wrong
# -Attempted solution was before I created this challenges project

def find_max_length(nums)
  i = 0
  answer = []
  p_answer = []
  until i == nums.length
      if p_answer.length == 0
          p_answer << nums[i]
      end
      if (nums[i] == 0 && nums[i+1] == 1) || (nums[i] == 1 && nums[i+1] == 0)
          p_answer << nums[i+1]
          i += 1
      else 
          if p_answer.length > answer.length
              answer = p_answer
          end
          p_answer = []
          i += 1
      end
  end
  answer.pop if answer.length.odd?
  return answer.length
end

# -Switching the 0 to -1 will help immensely
# -If switched to a sum array
# -Can figure out the length between similar numbers





