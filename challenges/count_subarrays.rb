# (3/29) Failed submission, come back after a month

################ Instructions ################ 

# You are given an integer array nums and a positive integer k.

# Return the number of subarrays where the maximum element of nums appears at least k times in that subarray.

# A subarray is a contiguous sequence of elements within an array.

 

# Example 1:

# Input: nums = [1,3,2,3,3], k = 2
# Output: 6
# Explanation: The subarrays that contain the element 3 at least 2 times are: [1,3,2,3], [1,3,2,3,3], [3,2,3], [3,2,3,3], [2,3,3] and [3,3].
# Example 2:

# Input: nums = [1,4,2,1], k = 3
# Output: 0
# Explanation: No subarray contains the element 4 at least 3 times.
 

# Constraints:

# 1 <= nums.length <= 105
# 1 <= nums[i] <= 106
# 1 <= k <= 105


################ Clarification Questions ################

# 1) Which built in Ruby methods am I allowed to use?

# 2) Is time or space complexity a major concern?

# 3) Is there a solution faster than O(n^2)?


################ Pseudocode ################ 

# -I definitely will want to use the permutation method in Ruby
# -First I'll want to check the max value in the array
# -Afterwards, check if it even shows up k amount of time (saves time for a false case)
# -Enumerable checking if the new arrays contain the k amount (use a counter)

# -Correction, I assumed there were permutations
# -By subarray, we're just splitting up the bigger array
# -We'll need two pointers, counting everytime the element shows up that amount of times

################ First Attempt ################ 

def count_subarrays(nums, k)
  max = nums.max
  count = 0
  i = 0
  j = (k-1)

  while (j < nums.length)
      while (j < nums.length)
          new_array = (nums[i..j])
          if (new_array.count(max) >= k)
              count += 1
          end
          j += 1
      end
      i += 1
      j = (i + k - 1)
  end
  return count
end

# Time limit was exceeded, which isn't surprising

################ Second Attempt ################ 

# -Looking at my notes, focusing on sliding window
# -The problem is the left side of the window
# -Will need quite a bit of variables
# -Will grow the sliding window until I hit k maxes
# -However, I will need to keep track of how many values are on the left

# -Still getting wrong values
# -I see, I need to add the lefts to the answer at each new value of nums


def count_subarrays(nums, k)
    max = nums.max
    appears = 0
    i = 0
    j = 0
    left = 0 
    answer = 0
    until j >= nums.length
        if nums[j] == max
            appears += 1
        end
        if appears == k
            until appears < k
                if nums[i] == max
                    appears -= 1
                end
                left += 1
                i += 1
            end
        end
        answer += left
        j += 1
    end
    return answer
end



################ Alternative Solutions ################

# Sliding window is most efficient

def count_subarrays(nums, k)
  max = nums.max
  left = res = count = 0

  nums.each do |val|
      count += 1 if val == max
      while count >= k
          count -= 1 if nums[left] == max
          left += 1
      end
      res += left
  end

  res
end