################ Instructions ################ 

# Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order.

# You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.


# Example 1:

# Input: nums = [1,2,1,3,2,5]
# Output: [3,5]
# Explanation:  [5, 3] is also a valid answer.
# Example 2:

# Input: nums = [-1,0]
# Output: [-1,0]
# Example 3:

# Input: nums = [0,1]
# Output: [1,0]

# Constraints:

# 2 <= nums.length <= 3 * 104
# -231 <= nums[i] <= 231 - 1
# Each integer in nums will appear twice, only two integers will appear once.

################ Clarification Questions ################

-Am I allowed to change the data type of nums?

-Preferred time and space complexity?

-Do I have to use XOR?

################ Pseudocode ################ 

-I think this can be solved with a hashmap
-However, may not comply with the directions of linear runtime

-Actually, maybe it will
-It'll be O(3n), because I'm asking to tally, then remove, then return
-Tally the elements
-Delete if they show up twice (+=1)
-Return keys

################ First Attempt ################ 

def single_number(nums)
  if nums.length == 2
      return nums
  else 
      answer = nums.tally
      answer.delete_if do |k,v|
          v == 2
      end
      return answer.keys
  end
end

################ Alternative Solutions ################

-Using bitwise values

def single_number(nums)
  bitmask = 0
  nums.each { |num| bitmask ^= num }

  diff = bitmask & (-bitmask)

  x = 0
  nums.each { |num| x ^= num if !(num & diff).zero? }

  [x, bitmask ^ x]    
end