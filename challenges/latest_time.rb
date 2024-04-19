################ Instructions ################ 

# You are given a string s representing a 12-hour format time where some of the digits (possibly none) are replaced with a "?".

# 12-hour times are formatted as "HH:MM", where HH is between 00 and 11, and MM is between 00 and 59. The earliest 12-hour time is 00:00, and the latest is 11:59.

# You have to replace all the "?" characters in s with digits such that the time we obtain by the resulting string is a valid 12-hour format time and is the latest possible.

# Return the resulting string.

# Example 1:

# Input: s = "1?:?4"

# Output: "11:54"

# Explanation: The latest 12-hour format time we can achieve by replacing "?" characters is "11:54".

# Example 2:

# Input: s = "0?:5?"

# Output: "09:59"

# Explanation: The latest 12-hour format time we can achieve by replacing "?" characters is "09:59".


# Constraints:

# s.length == 5
# s[2] is equal to the character ":".
# All characters except s[2] are digits or "?" characters.
# The input is generated such that there is at least one time between "00:00" and "11:59" that you can obtain after replacing the "?" characters.

################ Clarification Questions ################

# -What is the max amount of question marks?

# -Preferred Space and Time Complexity?


################ Pseudocode ################ 

# -First Thought, I'll have a list of if else conditionals
# -I'll need to check which place has the question mark
# -Going to keep track of that with a counter
# -Next, the first is either 1 or 0 dependent on the s[1]
# -s[3] should always be 5 if ?
# -s[4] should always be 9 if ?

# -Forgot if s[0] and s[1] are ?, I'll have to define that

################ First Attempt ################ 

def find_latest_time(s)
  i = 0
  answer = ""
  while i < s.length
      if s[i] == "?" 
          if i == 0
              if s[1] == "1" || s[1] == "0" || s[1] == "?"
                  answer << "1"
              else 
                  answer << "0"
              end
          elsif i == 1
              if s[0] == "0"
                  answer << "9"
              else 
                  answer << "1"
              end
          elsif  i == 3
              answer << "5"
          elsif i == 4
              answer << "9"
          end
      else 
          answer << s[i]
      end
      i += 1
  end
  return answer
end

################ Alternative Solutions ################

# Same idea, but with Ternary operators

def maximum_time(s)
  # Split the string into hours and minutes
  h, m = s.split(":")

  # Replace the hours
  h[0] = (h[1] == '?' || h[1].to_i < 2) ? '1' : '0' if h[0] == '?'
  h[1] = h[0] == '1' ? '9' : '9' if h[1] == '?'

  # Replace the minutes
  m[0] = '5' if m[0] == '?'
  m[1] = '9' if m[1] == '?'

  # Combine hours and minutes to form the result
  "#{h}:#{m}"
end
