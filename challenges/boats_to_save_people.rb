################ Instructions ################ 

You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit.

Return the minimum number of boats to carry every given person.


Example 1:

Input: people = [1,2], limit = 3
Output: 1
Explanation: 1 boat (1, 2)
Example 2:

Input: people = [3,2,2,1], limit = 3
Output: 3
Explanation: 3 boats (1, 2), (2) and (3)
Example 3:

Input: people = [3,5,3,4], limit = 5
Output: 4
Explanation: 4 boats (3), (3), (4), (5)

Constraints:

1 <= people.length <= 5 * 104
1 <= people[i] <= limit <= 3 * 104

################ Clarification Questions ################

# -Can I use Ruby's Built-In method sort?

# -Preferred time and space complexity?

# -Is every person able to get on a boat?

################ Pseudocode ################ 

# -Doesn't look too hard for a medium
# -I'm thinking two pointers
# -Will need to shift them differently if two people can fit, or if only one can fit
# -Will also need to account for people[-1]

# -Almost forgot these people were not sorted by weight
# -Probably a more efficient way, but I'll throw in a quick sort to make boat organization easier
# -Will need to shift the j to the end of the array however

################ First Attempt ################ 

def num_rescue_boats(people, limit)
  people.sort!
  i = 0
  j = (people.length - 1)
  boats = 0
  while (i < j)
      if people[i] + people[j] <= limit
          boats += 1
          i += 1
          j -= 1
      else
          boats += 1
          j -= 1
      end        
  end
  if i == j
      boats += 1
  end
  return boats
end

################ Alternative Solutions ################

def num_rescue_boats(people, limit)
  # Return 0 boats if no people need rescuing
  return 0 if people.empty?
  
  # Sorting the array of people by their weights
  people.sort!
  
  i = 0
  j = people.length - 1
  boats = 0

  # Using a two-pointer technique to pair the lightest and heaviest person that can share a boat
  while i <= j
    if people[i] + people[j] <= limit
      # If the lightest and heaviest person can share a boat, move both pointers
      i += 1
    end
    # Move the right pointer to fit the heaviest person in a boat
    j -= 1
    # Increase the boat count as one boat is used
    boats += 1
  end

  # Return the total number of boats needed
  boats
end
