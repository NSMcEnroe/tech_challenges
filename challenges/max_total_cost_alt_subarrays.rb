################ Instructions ################ 

# You are given an integer array nums with length n.

# The cost of a subarray nums[l..r], where 0 <= l <= r < n, is defined as:

# cost(l, r) = nums[l] - nums[l + 1] + ... + nums[r] * (−1)r − l

# Your task is to split nums into subarrays such that the total cost of the subarrays is maximized, ensuring each element belongs to exactly one subarray.

# Formally, if nums is split into k subarrays, where k > 1, at indices i1, i2, ..., ik − 1, where 0 <= i1 < i2 < ... < ik - 1 < n - 1, then the total cost will be:

# cost(0, i1) + cost(i1 + 1, i2) + ... + cost(ik − 1 + 1, n − 1)

# Return an integer denoting the maximum total cost of the subarrays after splitting the array optimally.

# Note: If nums is not split into subarrays, i.e. k = 1, the total cost is simply cost(0, n - 1).


# Example 1:

# Input: nums = [1,-2,3,4]

# Output: 10

# Explanation:

# One way to maximize the total cost is by splitting [1, -2, 3, 4] into subarrays [1, -2, 3] and [4]. The total cost will be (1 + 2 + 3) + 4 = 10.

# Example 2:

# Input: nums = [1,-1,1,-1]

# Output: 4

# Explanation:

# One way to maximize the total cost is by splitting [1, -1, 1, -1] into subarrays [1, -1] and [1, -1]. The total cost will be (1 + 1) + (1 + 1) = 4.

# Example 3:

# Input: nums = [0]

# Output: 0

# Explanation:

# We cannot split the array further, so the answer is 0.

# Example 4:

# Input: nums = [1,-1]

# Output: 2

# Explanation:

# Selecting the whole array gives a total cost of 1 + 1 = 2, which is the maximum.


# Constraints:

# 1 <= nums.length <= 105
# -109 <= nums[i] <= 109

################ Clarification Questions ################

# -Is it possible to solve it with memoization?

# -Preferred time and space complexity?

# -Would dynamic programming be the way to go?

################ Pseudocode ################ 

# -The description of this problem is super confusing
# -It looks like I just separate into subarrays
# -However, every other element in a subarray is flipped to the opposite splitting
# -Don't think this will work, especially with a O(n^2)
# -I'll run through the array, using the algorithm to flip the values
# -Once I find the max subarray, I'll go on to the next one
# -The problem is that values later on might be higher if they were flipped at a different time


################ First Attempt ################ 

# -Didn't think this would work, but I wanted to get at least one submission until timer ends

def maximum_total_cost(nums)
  i = 0
  j = 0
  k = 0
  odd = true
  window = 0
  max = -99999999999999
  answer = 0
  until i >= nums.length
      until j >= nums.length
          if odd == true
              odd = false
              window += nums[j]
              if window > max
                  max = window 
                  k = j
              end
          else
              odd = true
              window -= nums[j]
              if window > max
                  max = window 
                  k = j
              end
          end
          j += 1
          print window
      end
      answer += max
      i = (k+1)
      k = i
      j = i
      odd = true
      max = -99999999999999
      window = 0
  end
  return answer
end

# -Dynamic programming was the way to go
# -You have to look at each element at that point of time
# -With no worries of previous choices
# -To add a result, you can either have added or subtracted before
# -However, a subtraction must follow an addition
# -Adding an add result and sub result
# -You can keep track of hypothetical previous correct answers

################ Second Attempt ################

################ Alternative Solutions ################



