################ Instructions ################ 

# Given an array of integers nums, sort the array in increasing order based on the frequency of the values. If multiple values have the same frequency, sort them in decreasing order.

# Return the sorted array.


# Example 1:

# Input: nums = [1,1,2,2,2,3]
# Output: [3,1,1,2,2,2]
# Explanation: '3' has a frequency of 1, '1' has a frequency of 2, and '2' has a frequency of 3.
# Example 2:

# Input: nums = [2,3,1,3,2]
# Output: [1,3,3,2,2]
# Explanation: '2' and '3' both have a frequency of 2, so they are sorted in decreasing order.
# Example 3:

# Input: nums = [-1,1,-6,4,5,-6,1,4,1]
# Output: [5,-1,4,4,-6,-6,1,1,1]

# Constraints:

# 1 <= nums.length <= 100
# -100 <= nums[i] <= 100

################ Clarification Questions ################

# -Is a comparator the preferred method?

# -Preferred space and time complexity?

################ Pseudocode ################ 

# -Shouldn't be too bad with the tally method
# -Then sort the hash by value, or occurence
# -Afterwards, enumerate through the hash into a new array

# -Whoops, didn't read the instructions right
# -If tied by occurence, I need to organize the values by highest number
# -After some research, I can use a negative to indicate descending order

################ First Attempt ################ 

# -Not great for space complexity

def frequency_sort(nums)
  values = nums.tally
  new_values = values.sort_by {|key, value| [value, -key]}.to_h
  answer = []
  new_values.each do |key, value|
      value.times do
          answer << key
      end
  end
  return answer
end

################ Alternative Solutions ################

def frequency_sort(nums)
  # Count the frequency of each number
  values = Hash.new(0)
  nums.each { |num| values[num] += 1 }

  # Sort the numbers first by frequency (ascending), then by value (descending)
  sorted_nums = nums.sort_by { |num| [values[num], -num] }

  return sorted_nums
end