# Incomple personal solution. Re-try after May 12th

################ Instructions ################ 

# Given string num representing a non-negative integer num, and an integer k, return the smallest possible integer after removing k digits from num.

# Example 1:

# Input: num = "1432219", k = 3
# Output: "1219"
# Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
# Example 2:

# Input: num = "10200", k = 1
# Output: "200"
# Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
# Example 3:

# Input: num = "10", k = 2
# Output: "0"
# Explanation: Remove all the digits from the number and it is left with nothing which is 0.

# Constraints:

# 1 <= k <= num.length <= 105
# num consists of only digits.
# num does not have any leading zeros except for the zero itself.


################ Clarification Questions ################

# - With the length not being too long, how important is the time complexity

# - Will I be able to change num into different basic types?

# - Do we continue needing to use a stack?

# - Is a greedy algorithm the preferred solution?


################ Pseudocode ################ 

# -I'm thinking about using a hash map to count how often the number appears, and then enumerating through deleting the highest number
# -Wait, that won't work.  The numbers need to stay in order.

# -What if I saved the last integers in a stack, and then only took the lowest number in the first k+1 digits
# -Worked for case 1, but not the others
# -Won't work, the 0's complicate the solution

# -After some whiteboard work, I found out how to remove zeros in the front to the problem's specifications
# -However, I can't figure out how to delete the right numbers with non-zeros
# -Keep on getting example 1 wrong

# -Time's up


################ First Attempt ################ 

# (Self-afflicted) Time out
# Kept on flailing on the answer
# Figured out how to worry about trailing zeros, but not how to delete the last digit to ensure lowest number
# Example 1 was hard to crack

# -The code below does not work and is also bad, hency why it is commented out
# -Doesn't answer the problem's questions

# def remove_kdigits(num, k)
#     answer = []
#     new_array = num.split("")
#     end_digits = (num.length - k - 1)
#     while (end_digits > 0)
#         answer.unshift(new_array.pop)
#         end_digits -= 1
#     end
#     min = 10
#     new_array.each do |num|
#         if (num.to_i > 0) && (num.to_i < min)
#             min = num.to_i
#         end
#     end
#     answer.unshift(min.to_s)
#     answer.join("")
# end

################ Alternative Solutions ################

# My instict was right, it is a greedy solution.
# Don't have the algorithm down
# Intresting, compare the last number to the previous
# Pop if higher
# Afterwards remove all leading zeros

def remove_kdigits(num, k)
  stack = []
  num.each_char do |digit|
      while stack.any? && k > 0 && stack.last > digit
          stack.pop
          k -= 1
      end
      stack.push(digit)
  end

  # Adjust the stack size if k is still greater than 0
  stack = stack[0...stack.length - k] if k > 0

  # Create the result string from the stack and remove leading zeros
  result = stack.join.lstrip('0')

  # Return "0" if result is empty, otherwise return the result
  result.empty? ? "0" : result
end