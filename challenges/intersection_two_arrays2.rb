################ Instructions ################ 

# Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.


# Example 1:

# Input: nums1 = [1,2,2,1], nums2 = [2,2]
# Output: [2,2]
# Example 2:

# Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
# Output: [4,9]
# Explanation: [9,4] is also accepted. 

# Constraints:

# 1 <= nums1.length, nums2.length <= 1000
# 0 <= nums1[i], nums2[i] <= 1000

# Follow up:

# What if the given array is already sorted? How would you optimize your algorithm?
# What if nums1's size is small compared to nums2's size? Which algorithm is better?
# What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

################ Clarification Questions ################

# -Can the answer be an empty array?

# -Preferred time and space complexity?

# -Am I allowed to use the sort method?

# -Would a large difference in length affect the time complexity of the preferred answer?

################ Pseudocode ################ 

# -Unfortunately, intersection does not do repeated numbers

# -I think there is a faster way, but I'm just going to go with my gut
# -Sort both arrays
# -I'll need a counter for each array
# -Three options
# -If there is a similar number, advance the pointers and add the number to the answer
# -If one is bigger (or smaller), move one of the pointers

################ First Attempt ################ 

# -Better than average time and space complexity, but I think I can do better

def intersect(nums1, nums2)
  nums1.sort!
  nums2.sort!
  i = 0
  j = 0
  answer = []
  until i >= nums1.length || j >= nums2.length
      if nums1[i] == nums2[j]
          answer << nums1[i]
          i += 1
          j += 1
      elsif nums1[i] > nums2[j]
          j += 1
      else
          i += 1
      end
  end
  return answer
end

################ Alternative Solutions ################

# -When in doubt, use a hash map
# -Just tally, then run through nums2
# -If it's present in the hashmap, subtract 1 and put into answer

def intersect(nums1, nums2)
  counts = Hash.new(0)
  answer = []

  # Count elements in nums1
  nums1.each do |num|
      counts[num] += 1
  end

  # Find intersections with nums2
  nums2.each do |num|
      if counts[num] > 0
          answer << num
          counts[num] -= 1
      end
  end

  return answer
end