################ Instructions ################ 

# You are given an array nums of non-negative integers. nums is considered special if there exists a number x such that there are exactly x numbers in nums that are greater than or equal to x.

# Notice that x does not have to be an element in nums.

# Return x if the array is special, otherwise, return -1. It can be proven that if nums is special, the value for x is unique.


# Example 1:

# Input: nums = [3,5]
# Output: 2
# Explanation: There are 2 values (3 and 5) that are greater than or equal to 2.
# Example 2:

# Input: nums = [0,0]
# Output: -1
# Explanation: No numbers fit the criteria for x.
# If x = 0, there should be 0 numbers >= x, but there are 2.
# If x = 1, there should be 1 number >= x, but there are 0.
# If x = 2, there should be 2 numbers >= x, but there are 0.
# x cannot be greater since there are only 2 numbers in nums.
# Example 3:

# Input: nums = [0,4,3,0,4]
# Output: 3
# Explanation: There are 3 values that are greater than or equal to 3.

# Constraints:

# 1 <= nums.length <= 100
# 0 <= nums[i] <= 1000

################ Clarification Questions ################

# -Should I sort the numbers beforehand?

# -Preferred time and space complexity?

################ Pseudocode ################ 

# -Will need two different variables
# -One to keep track of numbers larger than the answer
# -And the answer itself
# -I'm thinking I have one going in the positive direction, and one going in the negative direction
# -Iterate through, and keep track when they hit each other
# -Reset the numbers counter if it's still bigger than the answer

################ First Attempt ################ 

def special_array(nums)
  answer = nums.length
  numbers = 0
  while answer > 0
      nums.each do |num|
          if num >= answer
              numbers += 1
          end
      end
      if numbers == answer
          return answer
      elsif numbers > answer
          return -1
      else
          answer -= 1
          numbers = 0
      end
  end
  return -1
end

################ Alternative Solutions ################

# -Should have sorted
# - Used each with index again, need to study that more

def special_array(nums)
  n = nums.length
  s_nums = nums.sort
  return -1 if s_nums.last.zero?
  return n if s_nums[0] == n

  prev = -1
  s_nums.each_with_index do |el, i|
    tail = n - i
    return tail if prev < tail && tail <= el

    prev = el
  end
  -1
end