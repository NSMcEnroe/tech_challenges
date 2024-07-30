################ Instructions ################ 

Given an array nums of size n, return the majority element.

The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

Example 1:

Input: nums = [3,2,3]
Output: 3
Example 2:

Input: nums = [2,2,1,1,1,2,2]
Output: 2

Constraints:

n == nums.length
1 <= n <= 5 * 104
-109 <= nums[i] <= 109

################ Clarification Questions ################

# -Can there be more than 2 candidates?

# -Preferred space and time complexity?

# -Since the answer will always have to appear more than n/2 times, is there a need for verification?

################ Pseudocode ################ 

# -I want to solve it with ease first, not optimized
# -I'm thinking a hashmap seems reasonable
# -Afterwards, organize the hashmap be descending value, and just return the first element of the first element

################ First Attempt ################ 

# -Easy solution, but want to research more efficient algorithm

def majority_element(nums)
  hash = nums.tally
  hash.sort_by{|k,v| -v}[0][0]
end


################ Alternative Solutions ################

# -My edited version of Moore's voting algorithm, due to stated constraints
# -Strangely, is much better in space and time complexity
# -However, does not appear so with submission percentages

def majority_element(nums)
  candidate = nil 
  count = 0
  nums.each do |el|
      if count == 0
          candidate = el
          count += 1
      elsif candidate == el
          count += 1
      else
          count -= 1
      end
  end
  return candidate
end