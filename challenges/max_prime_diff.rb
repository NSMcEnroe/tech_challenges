################ Instructions ################ 

# You are given an integer array nums.

# Return an integer that is the maximum distance between the indices of two (not necessarily different) prime numbers in nums.


# Example 1:

# Input: nums = [4,2,9,5,3]

# Output: 3

# Explanation: nums[1], nums[3], and nums[4] are prime. So the answer is |4 - 1| = 3.

# Example 2:

# Input: nums = [4,8,2,8]

# Output: 0

# Explanation: nums[2] is prime. Because there is just one prime number, the answer is |2 - 2| = 0.


# Constraints:

# 1 <= nums.length <= 3 * 105
# 1 <= nums[i] <= 100
# The input is generated such that the number of prime numbers in the nums is at least one.


################ Clarification Questions ################

# - Can I use a built-in Ruby sort?

# - Preferred Time and Space Complexity?

# - What if there are no prime numbers?

# - Can I use a built-in Ruby prime?

################ Pseudocode ################ 

# -Correction, realized I dont't need to sort
# -I'm comparing indices, not numbers
# -So I'm thinking I store indices
# -Enumerate through the values
# -Compare them to my prime array
# -Save the indices that are correct
# -Subract the first from the last

# -Dang, forgot 1 was a prime number


################ First Attempt ################ 

# -Fine time complexity, but uses too much storage
# -Assuming I don't need a prime array

def maximum_prime_difference(nums)
  i = 0
  indices = []
  all_prime_numbers = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
  while i < nums.length
      if all_prime_numbers.include?(nums[i])
          indices << i
      end
      i += 1
  end
  return (indices[-1] - indices[0])
end

################ Alternative Solutions ################

require 'set'

def maximum_prime_difference(nums)
  # Define prime numbers as a Set
  prime_numbers = Set.new([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97])
  
  first_index = nil
  last_index = nil

  # Iterate with index
  nums.each_with_index do |num, i|
    if prime_numbers.include?(num)
      first_index ||= i
      last_index = i
    end
  end

  # Return the difference or nil if no primes are found
  first_index && last_index ? last_index - first_index : 0
end