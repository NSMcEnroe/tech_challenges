################ Instructions ################ 

# You are given a binary array nums and an integer k.

# A k-bit flip is choosing a subarray of length k from nums and simultaneously changing every 0 in the subarray to 1, and every 1 in the subarray to 0.

# Return the minimum number of k-bit flips required so that there is no 0 in the array. If it is not possible, return -1.

# A subarray is a contiguous part of an array.


# Example 1:

# Input: nums = [0,1,0], k = 1
# Output: 2
# Explanation: Flip nums[0], then flip nums[2].
# Example 2:

# Input: nums = [1,1,0], k = 2
# Output: -1
# Explanation: No matter how we flip subarrays of size 2, we cannot make the array become [1,1,1].
# Example 3:

# Input: nums = [0,0,0,1,0,1,1,0], k = 3
# Output: 3
# Explanation: 
# Flip nums[0],nums[1],nums[2]: nums becomes [1,1,1,1,0,1,1,0]
# Flip nums[4],nums[5],nums[6]: nums becomes [1,1,1,1,1,0,0,0]
# Flip nums[5],nums[6],nums[7]: nums becomes [1,1,1,1,1,1,1,1]

# Constraints:

# 1 <= nums.length <= 105
# 1 <= k <= nums.length

################ Clarification Questions ################

# -Preferred time and space complexity?

################ Pseudocode ################ 

# # -Unfotunately, with the nums.length constraint, I'm going to run into time troubles
# -Run through nums
# -If it's a 0, flip the following k
# -I want to keep track of how many I flip, that will help with running time by skipping 1's
# -Track the flips

################ First Attempt ################ 

# -Takes too long :(

def min_k_bit_flips(nums, k)
  answer = 0
  i = 0
  ones = true
  counter = 0
  until i >= nums.length
      if nums[i] == 0
          (0..(k-1)).each do |j|
              if nums[i+j] == nil
                  return -1
              elsif nums [i+j] == 0
                  nums[i+j] = 1
                  if ones == true
                      counter += 1
                  end
              else   
                  nums[i+j] = 0
                  ones = false
              end
          end
          answer += 1
  
          i += counter
          ones = true
          counter = 0
      else 
          i += 1
      end
  end 
  return answer            
end

# -It looks like modifying the array outside the usual o, 1 is the answer
# -Also will need to bitwise flip whenever we do flips
# -Allows us to "flip" without affecting elements

################ Second Attempt ################

# -Doesn't work for "quick flips"

def min_k_bit_flips(nums, k)
    answer = 0
    flip = 0
    pivot = nums.length - k
    marker = pivot
    (0...pivot).each do |i|
        if i == marker
            flip = 0
        end
        if nums[i] == flip
            if flip == 0
                flip = 1
            else 
                flip = 0
            end
            answer += 1
            marker = k + i
        end
    end
    flip = nums[pivot]
    if marker <= pivot
        marker = pivot + k + 1
    end
    (pivot...(pivot+k)).each do |i|
        if i >= marker
            if nums[i] == flip 
                return -1
            end
        else
            if nums[i] != flip 
                return -1
            end
        end
    end
    if nums[pivot + k - 1] == 0
        return (answer + 1)
    else
        return answer
    end
end

# -Make your marker when you flip, not at the end.  This helps prevent problems with "quick flips"
# - Switch the flip once you get to an end of a marker
# -To be more concise, ^= is a bit flip operator (in case I forget)

################ Alternative Solutions ################


