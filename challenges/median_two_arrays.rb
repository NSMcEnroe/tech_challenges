# First Hard challenge

################ Instructions ################ 

# Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

# The overall run time complexity should be O(log (m+n)).

# Example 1:

# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.
# Example 2:

# Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

# Constraints:

# nums1.length == m
# nums2.length == n
# 0 <= m <= 1000
# 0 <= n <= 1000
# 1 <= m + n <= 2000
# -106 <= nums1[i], nums2[i] <= 106

################ Clarification Questions ################

# 1) Is each element an integer? (Assuming yes)

# 2) Can there be repeats? (Don't believe that should affect the answer)

# 3) When is it most efficient to change the value into a float?

################ Pseudocode ################ 

# -My attempt will not try to hit O(log m + log n) time complexity
# -Will need to combine the arrays and sort them
# -The ruby sort is unfortunately a quicksort, so Im already hitting O(nlogn)
# -However, should be easy after that
# -If there is a true median, just return the middle element using the length of the merged array
# -If not, find the average of the 2 middle elements

################ First Attempt ################ 

def find_median_sorted_arrays(nums1, nums2)
  n = (nums1 + nums2).length
  sorted = (nums1 + nums2).sort
  if n.odd?
      return sorted[(n/2)]
  else
      return (sorted[(n/2)-1] + sorted[(n/2)]).to_f / 2
  end
end

# Although I did not hit the desired time complexity, I still hit the top 15% of answers

################ Alternative Solutions ################


def find_median_sorted_arrays(nums1, nums2)
  a, b = nums1, nums2
  m, n = a.length, b.length
  if m > n
      a, b, m, n = b, a, n, m  # Ensure a is the shorter array
  end

  imin, imax, half_len = 0, m, (m + n + 1) / 2
  while imin <= imax do
      i = (imin + imax) / 2
      j = half_len - i
      if i < m && b[j-1] > a[i]
          imin = i + 1
      elsif i > 0 && a[i-1] > b[j]
          imax = i - 1
      else  # Correct partition
          max_of_left = 0
          if i == 0 
              max_of_left = b[j-1]
          elsif j == 0 
              max_of_left = a[i-1]
          else 
              max_of_left = [a[i-1], b[j-1]].max
          end
          
          if (m + n) % 2 == 1
              return max_of_left
          end

          min_of_right = 0
          if i == m 
              min_of_right = b[j]
          elsif j == n 
              min_of_right = a[i]
          else 
              min_of_right = [a[i], b[j]].min
          end

          return (max_of_left + min_of_right) / 2.0
      end
  end
end

# -Make A the shorter array
# -Uses binary search
# -Partitions the lower middle number of a and b separately
# -Compares the median of both to find the true median
# -Has an if else statement to compare odd or even total of numbers