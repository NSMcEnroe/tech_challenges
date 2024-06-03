################ Instructions ################ 

# Given an integer number n, return the difference between the product of its digits and the sum of its digits.

# Example 1:

# Input: n = 234
# Output: 15 
# Explanation: 
# Product of digits = 2 * 3 * 4 = 24 
# Sum of digits = 2 + 3 + 4 = 9 
# Result = 24 - 9 = 15
# Example 2:

# Input: n = 4421
# Output: 21
# Explanation: 
# Product of digits = 4 * 4 * 2 * 1 = 32 
# Sum of digits = 4 + 4 + 2 + 1 = 11 
# Result = 32 - 11 = 21

# Constraints:

# 1 <= n <= 10^5

################ Clarification Questions ################

# -Can I switch the number to a string and then back, or would that ruin the time complexity?

# -Preferred time and space complexity?

# -Although the instructions say any integer, the constraints say otherwise.  Clarification?

################ Pseudocode ################ 

# -I've seen convert numbers into their digit places before
# -Last time I used a string converter, but it took a while
# -I'm pretty sure % is faster
# -If I take the remainder, I can shove it into an array
# -Afterwards, I just run through the array twice
# -Once to calculate products, and the second for sums

################ First Attempt ################ 

# -Both time and space complexity could be better

def subtract_product_and_sum(n)
  digits = []
  while n > 9 
      digits << n % 10
      n = n/10
  end
  digits << n
  products = 1
  digits.each do |n|
      products *= n
  end
  return (products - digits.sum)
end

################ Alternative Solutions ################

# -Only one loop

def subtract_product_and_sum(n)
  product = 1
  sum = 0

  while n > 0
    digit = n % 10
    product *= digit
    sum += digit
    n /= 10
  end

  product - sum
end


