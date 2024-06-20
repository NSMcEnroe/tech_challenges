################ Instructions ################ 

# You are given an integer array nums. In one move, you can pick an index i where 0 <= i < nums.length and increment nums[i] by 1.

# Return the minimum number of moves to make every value in nums unique.

# The test cases are generated so that the answer fits in a 32-bit integer.


# Example 1:

# Input: nums = [1,2,2]
# Output: 1
# Explanation: After 1 move, the array could be [1, 2, 3].
# Example 2:

# Input: nums = [3,2,1,2,1,7]
# Output: 6
# Explanation: After 6 moves, the array could be [3, 4, 1, 2, 5, 7].
# It can be shown with 5 or less moves that it is impossible for the array to have all unique values.

# Constraints:

# 1 <= nums.length <= 105
# 0 <= nums[i] <= 105

################ Clarification Questions ################

# -Can I use the sort method?

# -Preferred time and space complexity?

# -Will incrementing by one exceed the time limit?

################ Pseudocode ################ 

# -Unfortunately, I think I will have to start off with a quick sort
# -That'll already put me at O(nlogn)
# -I will also need an answer counter
# -However, afterwards shouldn't be too hard
# -Run through each element, and add one until it's a new number
# -Add that to the counter

# -Correction, for too big of arrays, it's easier to just find the difference
# -More space intensive, but will save my runtime


################ First Attempt ################ 

def min_increment_for_unique(nums)
  return 0 if nums.length == 1
  nums.sort!
  answer = 0
  (1..(nums.length-1)).each do |i|
      if nums[i] <= nums[i-1]
          difference = nums[i-1] - nums[i] + 1
          answer += difference
          nums[i] += difference
      end
  end
  return answer
end

################ Alternative Solutions ################

def min_increment_for_unique(nums)
  n = nums.length
  max = 0
  min_increments = 0

  # Find maximum value in array to determine range of frequency_count array
  nums.each do |val|
      max = [max, val].max
  end

  # Create a frequency_count array to store the frequency of each value in nums
  frequency_count = Array.new(n + max, 0)

  # Populate frequency_count array with the frequency of each value in nums
  nums.each do |val|
      frequency_count[val] += 1
  end

  # Iterate over the frequency_count array to make all values unique
  (0...frequency_count.length).each do |i|
      next if frequency_count[i] <= 1

      # Determine excess occurrences, carry them over to the next value,
      # ensure single occurrence for current value, and update min_increments.
      duplicates = frequency_count[i] - 1
      frequency_count[i + 1] += duplicates
      frequency_count[i] = 1
      min_increments += duplicates
  end

  min_increments
end