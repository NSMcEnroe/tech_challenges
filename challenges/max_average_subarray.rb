################ Instructions ################ 

# You are given an integer array nums consisting of n elements, and an integer k.

# Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.


# Example 1:

# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
# Example 2:

# Input: nums = [5], k = 1
# Output: 5.00000

# Constraints:

# n == nums.length
# 1 <= k <= n <= 105
# -104 <= nums[i] <= 104

################ Clarification Questions ################

# - Does the float need to have a minimum or maximum amount of numbers after the decimal point?

# - Preferred time and space complexity?

# - Is there a preferred time to switch the integer to a float?

################ Pseudocode ################ 

# -Already attempted this problem a couple months ago
# -Will include previous attempt below
# -My previous solution timed out 

# -Due to previous solution, I know I need to minimize my time complexity
# -Will need to include a sliding window algorithm
# -Don't want to recalculate the sum of every new window
# -Will want two pointers, always deleting the first and adding the second
# -Will need a third variable to store the max sum
# -Will need to include an outlet if the length is = to k


################ First Attempt ################ 

# Timed out, due to recalculating the sum each time

def find_max_average(nums, k)
    i = 0
    j = nums[i..(k-1)].sum

  while i < (nums.length - k)
    i += 1
    if nums[i..(i+k-1)].sum > j
      j = nums[i..(i+k-1)].sum
    end
  end

  return (j.to_f/k)
end

################ Second Attempt ################ 

# Utilized sliding window, but not efficient time wise still

def find_max_average(nums, k)
  i = 0
  j = nums[i..(k-1)].sum
  answer = j
  return (nums.sum.to_f/k) if (nums.length == k)
  while (k < nums.length)
      j += nums[k]
      j -= nums[i]
      i += 1
      k += 1
      answer = [j, answer].max
  end
  return (answer.to_f/(k-i))
end

################ Alternative Solutions ################

# -Uses less variables
# -Uses built in Ruby methods better
# -Need to utilize ranges better

def find_max_average(nums, k)
  return nums.sum.to_f / k if nums.length <= k

  max_sum = 0
  current_sum = nums[0...k].sum
  max_sum = current_sum

  (k...nums.length).each do |end_index|
    current_sum += nums[end_index] - nums[end_index - k]
    max_sum = [max_sum, current_sum].max
  end

  max_sum.to_f / k
end
