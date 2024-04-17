################ Instructions ################ 

# You are given two positive integer arrays nums and numsDivide. You can delete any number of elements from nums.

# Return the minimum number of deletions such that the smallest element in nums divides all the elements of numsDivide. If this is not possible, return -1.

# Note that an integer x divides y if y % x == 0.


# Example 1:

# Input: nums = [2,3,2,4,3], numsDivide = [9,6,9,3,15]
# Output: 2
# Explanation: 
# The smallest element in [2,3,2,4,3] is 2, which does not divide all the elements of numsDivide.
# We use 2 deletions to delete the elements in nums that are equal to 2 which makes nums = [3,4,3].
# The smallest element in [3,4,3] is 3, which divides all the elements of numsDivide.
# It can be shown that 2 is the minimum number of deletions needed.
# Example 2:

# Input: nums = [4,3,6], numsDivide = [8,2,6,10]
# Output: -1
# Explanation: 
# We want the smallest element in nums to divide all the elements of numsDivide.
# There is no way to delete elements from nums to allow this.

# Constraints:

# 1 <= nums.length, numsDivide.length <= 105
# 1 <= nums[i], numsDivide[i] <= 109

################ Clarification Questions ################

# -Preferred Time and Space Complexity?

# -Do I run through the entire array of nums for repeats every time I find a dud?

# -Can I use sort, or any other built in Ruby methods?

################ Pseudocode ################ 

# -Thinking about using a seen hash
# -If the number has already been seen, += 1 that key
# -Keep on going until I hit a value that Works
# -Hmm, hard to get a correct value and stop my process

# -Well, misunderstood the question, since it's the smallest integer
# -Will need to sort
# -Want to make the integers unique, since the array can get quite long, but with a relatively low max valuie
# -Want to use a boolean to break a loop 
# -However, can still use the seen hash
# -Either return the sum off all values, or -1

end

################ First Attempt ################ 

# -Submission claims optimal answer, but I'll see if there are any ways to improve

def min_operations(nums, nums_divide)
  used = {}
  i = 0
  new_nums = nums.sort.uniq
  uniq_nums_divide = nums_divide.uniq
  while i < new_nums.length
      check = uniq_nums_divide.all? do |n|
          n % new_nums[i] == 0
      end
      if check == true
          i = nums.length
      else 
          used[new_nums[i]] = 0
          i += 1
      end
  end
  nums.each do |num|
      if used.key?(num)
          used[num] += 1
      end
  end
  return -1 if used.values.sum == nums.length
  return used.values.sum
end

################ Alternative Solutions ################

# Similar solution, but stores the % operation into a variable

def min_operations(nums, nums_divide)
  # Sort and unique the arrays
  new_nums = nums.sort.uniq
  uniq_nums_divide = nums_divide.uniq

  # Find the smallest number in new_nums that can divide all elements in uniq_nums_divide
  smallest_divisor = new_nums.find do |candidate|
    uniq_nums_divide.all? { |n| n % candidate == 0 }
  end

  # If no valid divisor is found, return -1
  return -1 unless smallest_divisor

  # Count how many numbers need to be removed from nums
  nums.count { |num| num != smallest_divisor }
end