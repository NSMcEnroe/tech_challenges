# ################ Instructions ################ 

# You are given a binary array nums.

# You can do the following operation on the array any number of times (possibly zero):

# Choose any 3 consecutive elements from the array and flip all of them.
# Flipping an element means changing its value from 0 to 1, and from 1 to 0.

# Return the minimum number of operations required to make all elements in nums equal to 1. If it is impossible, return -1.


# Example 1:

# Input: nums = [0,1,1,1,0,0]

# Output: 3

# Explanation:
# We can do the following operations:

# Choose the elements at indices 0, 1 and 2. The resulting array is nums = [1,0,0,1,0,0].
# Choose the elements at indices 1, 2 and 3. The resulting array is nums = [1,1,1,0,0,0].
# Choose the elements at indices 3, 4 and 5. The resulting array is nums = [1,1,1,1,1,1].
# Example 2:

# Input: nums = [0,1,1,1]

# Output: -1

# Explanation:
# It is impossible to make all elements equal to 1.


# Constraints:

# 3 <= nums.length <= 105
# 0 <= nums[i] <= 1

################ Clarification Questions ################

# -Would certain binary operators make this problem easier?

# -Preferred time and space complexity?

################ Pseudocode ################ 

# - Will definitely need a seperate answer variable
# -If I run through the array, I can hit a conditional whenever i = 0
# -Flip that number along with the next two
# -Will want to run through only once for time complexity, so I'll keep the logic in that loop
# -Don't want to hit a nil during my loop
# -I'll pop off the last three and check if they are the same


################ First Attempt ################ 

# -Time complexity: O(n)
# -Space complexity: O(1)

def min_operations(nums)
  answer = 0
  last = []
  (0..(nums.length-4)).each do |i|
      if nums[i] == 0
          answer += 1
          nums[i] = 1
          if nums[i+1] == 0
              nums[i+1] = 1
          else 
              nums[i+1] = 0
          end
          if nums[i+2] == 0
              nums[i+2] = 1
          else 
              nums[i+2] = 0
          end
      end
  end
  last << nums.pop(3)
  if last == [[1,1,1]]
      return answer
  elsif last == [[0,0,0]]
      return (answer + 1)
  else
      return -1
  end
end


################ Alternative Solutions ################

# -This answer is more straightforward, as well as uses the XOR operatio ^=

def min_operations(nums)
  n = nums.length
  operations = 0

  # Traverse through the array
  (0..n - 3).each do |i|
    if nums[i] == 0
      # Perform the flip operation at index i
      nums[i] ^= 1
      nums[i + 1] ^= 1
      nums[i + 2] ^= 1
      operations += 1
    end
  end

  # Check the last two elements
  if nums[n - 2] == 0 || nums[n - 1] == 0
    return -1
  end

  return operations
end