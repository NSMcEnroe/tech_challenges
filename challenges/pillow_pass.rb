################ Instructions ################ 

# There are n people standing in a line labeled from 1 to n. The first person in the line is holding a pillow initially. Every second, the person holding the pillow passes it to the next person standing in the line. Once the pillow reaches the end of the line, the direction changes, and people continue passing the pillow in the opposite direction.

# For example, once the pillow reaches the nth person they pass it to the n - 1th person, then to the n - 2th person and so on.
# Given the two positive integers n and time, return the index of the person holding the pillow after time seconds.


# Example 1:

# Input: n = 4, time = 5
# Output: 2
# Explanation: People pass the pillow in the following way: 1 -> 2 -> 3 -> 4 -> 3 -> 2.
# After five seconds, the 2nd person is holding the pillow.
# Example 2:

# Input: n = 3, time = 2
# Output: 3
# Explanation: People pass the pillow in the following way: 1 -> 2 -> 3.
# After two seconds, the 3rd person is holding the pillow.

# Constraints:

# 2 <= n <= 1000
# 1 <= time <= 1000

################ Clarification Questions ################

# -Can I hold an extra variable that determines direction?

# -Preferred time and space complexity?

# - N and Time are quite low?  Does that imply less optimized solutions could work?

################ Pseudocode ################ 

# -I believe don't even need to keep track of space, just direction
# -Flip direction whenever I hit (n-1), remove from already variable n
# -Once I can subract without going negative, that's the value

################ First Attempt ################ 

# -A little slow and terrible space complexity
# - Second look, it's still O(1)

def pass_the_pillow(n, time)
  forward = true
  until time < n
      time -= (n-1)
      if forward == true
          forward = false
      else   
          forward = true
      end
  end
  if forward == true
      return time + 1
  else
      return n - time
  end
end

################ Alternative Solutions ################

# -Can't be afraid of not going through the iteration piece by piece
# - % Comes in clutch again

def pass_the_pillow(n, time)
  # Calculate the number of complete rounds of pillow passing
  full_rounds = time / (n - 1)

  # Calculate the remaining time after complete rounds
  extra_time = time % (n - 1)

  # Determine the position of the person holding the pillow
  # If full_rounds is even, the pillow is moving forward.
  # If full_rounds is odd, the pillow is moving backward.
  if full_rounds % 2 == 0
      return extra_time + 1  # Position when moving forward
  else
      return n - extra_time  # Position when moving backward
  end    
end