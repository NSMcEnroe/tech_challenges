################ Instructions ################ 

# You are given two integer arrays of equal length target and arr. In one step, you can select any non-empty subarray of arr and reverse it. You are allowed to make any number of steps.

# Return true if you can make arr equal to target or false otherwise.

# Example 1:

# Input: target = [1,2,3,4], arr = [2,4,1,3]
# Output: true
# Explanation: You can follow the next steps to convert arr to target:
# 1- Reverse subarray [2,4,1], arr becomes [1,4,2,3]
# 2- Reverse subarray [4,2], arr becomes [1,2,4,3]
# 3- Reverse subarray [4,3], arr becomes [1,2,3,4]
# There are multiple ways to convert arr to target, this is not the only way to do so.
# Example 2:

# Input: target = [7], arr = [7]
# Output: true
# Explanation: arr is equal to target without any reverses.
# Example 3:

# Input: target = [3,7,9], arr = [3,7,11]
# Output: false
# Explanation: arr does not have value 9 and it can never be converted to target.

# Constraints:

# target.length == arr.length
# 1 <= target.length <= 1000
# 1 <= target[i] <= 1000
# 1 <= arr[i] <= 1000

################ Clarification Questions ################

# -Do I need to incorporate the swaps, since the problem seems like it can be solved an easier way?

# -Preferred space and time complexity?

# -Am I allowed to use the quicksort algorithm?

################ Pseudocode ################ 

# -Looking at the problem, the wording seems to make it way too complicated
# -If I have unlimited swaps, then I just need to check if they have the same values
# -A sort would be easy, but is probably not the most efficient

# -I'll submit that for now, and try to come up with a better solution


################ First Attempt ################ 

# -Great space complexity, but mediocre time complexity
# -Not surprised due to quicksort algorithm

def can_be_equal(target, arr)
  target.sort == arr.sort
end


################ Alternative Solutions ################

# -Focuses on altering a new array, based off a value
# -Uses each_with_index
# -Need to understand the counting can work on harder problems

def can_be_equal(target_array, current_array)
  
  count = Array.new(1001, 0)
  target_array.each_with_index do |num, i|
    count[num] += 1
    count[current_array[i]] -= 1
  end

  count.all? { |c| c == 0 }
end