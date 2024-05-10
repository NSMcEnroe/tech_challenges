################ Instructions ################ 

You are given an integer array pref of size n. Find and return the array arr of size n that satisfies:

pref[i] = arr[0] ^ arr[1] ^ ... ^ arr[i].
Note that ^ denotes the bitwise-xor operation.

It can be proven that the answer is unique.


Example 1:

Input: pref = [5,2,0,3,1]
Output: [5,7,2,3,2]
Explanation: From the array [5,7,2,3,2] we have the following:
- pref[0] = 5.
- pref[1] = 5 ^ 7 = 2.
- pref[2] = 5 ^ 7 ^ 2 = 0.
- pref[3] = 5 ^ 7 ^ 2 ^ 3 = 3.
- pref[4] = 5 ^ 7 ^ 2 ^ 3 ^ 2 = 1.
Example 2:

Input: pref = [13]
Output: [13]
Explanation: We have pref[0] = arr[0] = 13.

Constraints:

1 <= pref.length <= 105
0 <= pref[i] <= 106


################ Clarification Questions ################

-What is xor?

-Preferred time and space complexity?


################ Pseudocode ################ 

# -My second attempt at this problem
# -Didn't quite understand the purpose of xor
# -However, after my first failed attempt, which was brute force
# -Learned that you don't quite need to understand xor
# -Just need to use the operation

# -Therefore, will need an answer array
# -Add to the array with the xor operation, comparing i+1 to i in the index

################ Second Attempt ################ 

-Great time and space complexity

def find_array(pref)
  answer = []
  i = 0
  answer << pref[i]
  i += 1
  while i < pref.length
      answer << (pref[i-1] ^ pref[i])
      i += 1
  end
  return answer
end


################ Alternative Solutions ################

def find_array(pref)
  n = pref.length

  (n-1).downto(1).each do |i|
      pref[i] = pref[i] ^ pref[i-1]
  end

  pref
end