# Does not contain personal solution

################ Instructions ################ 

# You are given an integer array coins representing coins of different denominations and an integer k.

# You have an infinite number of coins of each denomination. However, you are not allowed to combine coins of different denominations.

# Return the kth smallest amount that can be made using these coins.


# Example 1:

# Input: coins = [3,6,9], k = 3

# Output:  9

# Explanation: The given coins can make the following amounts:
# Coin 3 produces multiples of 3: 3, 6, 9, 12, 15, etc.
# Coin 6 produces multiples of 6: 6, 12, 18, 24, etc.
# Coin 9 produces multiples of 9: 9, 18, 27, 36, etc.
# All of the coins combined produce: 3, 6, 9, 12, 15, etc.

# Example 2:

# Input: coins = [5,2], k = 7

# Output: 12 

# Explanation: The given coins can make the following amounts:
# Coin 5 produces multiples of 5: 5, 10, 15, 20, etc.
# Coin 2 produces multiples of 2: 2, 4, 6, 8, 10, 12, etc.
# All of the coins combined produce: 2, 4, 5, 6, 8, 10, 12, 14, 15, etc.


# Constraints:

# 1 <= coins.length <= 15
# 1 <= coins[i] <= 25
# 1 <= k <= 2 * 109
# coins contains pairwise distinct integers.


################ Clarification Questions ################

- Am I allowed to use the Ruby built-in quicksort?

- Preferred Time and Space Complexity?


################ Pseudocode ################ 

# -Preface: This was a hard problem in a contest
# -Therefore, won't be kicking myself if I don't get this right

# -I'm thinking I shove all the multiples into a single array k times
# - Remove repeats
# -Then find the right kth amount
# -Problem is, since k can be huge, I will definitely time out
# -Yep, did


################ First Attempt ################ 

def find_kth_smallest(coins, k)
    possibilities = []
    coins.each do |amount|
        possibilities += amount.step((k * amount),amount).to_a
    end
    return possibilities.uniq.sort![k-1]
end

################ Alternative Solutions ################

# -Looks like it was done with a priority queue and a seen hash, not as bad as I thought

def kth_smallest(coins, k)
  # Create a priority queue (using an array to simulate it)
  pq = []
  
  # A hash to keep track of which values have been seen/added to the queue
  seen = {}
  
  # Initialize the priority queue with the first multiple of each coin
  coins.each do |coin|
    pq << coin
    seen[coin] = true
  end

  # Sort the priority queue initially
  pq.sort!
  
  current_min = 0

  # Repeat k times to find the kth smallest element
  k.times do
    # Extract the smallest element (first element after sorting)
    current_min = pq.shift

    # Generate the next set of multiples for the current smallest element
    coins.each do |coin|
      next_val = current_min + coin
      unless seen[next_val]
        # Insert into priority queue and mark as seen
        pq << next_val
        seen[next_val] = true
      end
    end

    # Sort the priority queue again after adding new elements
    pq.sort!
  end
  
  current_min
end