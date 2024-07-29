################ Instructions ################ 

# You are given an integer array score of size n, where score[i] is the score of the ith athlete in a competition. All the scores are guaranteed to be unique.

# The athletes are placed based on their scores, where the 1st place athlete has the highest score, the 2nd place athlete has the 2nd highest score, and so on. The placement of each athlete determines their rank:

# The 1st place athlete's rank is "Gold Medal".
# The 2nd place athlete's rank is "Silver Medal".
# The 3rd place athlete's rank is "Bronze Medal".
# For the 4th place to the nth place athlete, their rank is their placement number (i.e., the xth place athlete's rank is "x").
# Return an array answer of size n where answer[i] is the rank of the ith athlete.


# Example 1:

# Input: score = [5,4,3,2,1]
# Output: ["Gold Medal","Silver Medal","Bronze Medal","4","5"]
# Explanation: The placements are [1st, 2nd, 3rd, 4th, 5th].
# Example 2:

# Input: score = [10,3,8,9,4]
# Output: ["Gold Medal","5","Bronze Medal","Silver Medal","4"]
# Explanation: The placements are [1st, 5th, 3rd, 2nd, 4th].


# Constraints:

# n == score.length
# 1 <= n <= 104
# 0 <= score[i] <= 106
# All the values in score are unique.

################ Clarification Questions ################

# -Can the integers be negative?

# -Preferred space and time complexity?

################ Pseudocode ################ 

# -Attempted this problem much earlier when I did not have a good grasp of organizing hashmaps

# -A hashmap seems to be the way to start
# -Want to organize by the index
# -And then sort by keys in descending order
# -Afterwards, will want to run through an integer enumerable
# -If i is 1,2,3, replace with the Medal
# -Otherwise, .to_s

################ First Attempt ################ 

# -Great time complexity, and okay space complexity
# -Will see if there are more optimal answers worth the effort

def find_relative_ranks(score)
  highs = {}
  score.each_with_index do |n, index|
      highs[n] = index
  end
  ranked = highs.sort_by{|k, v| -k}
  answer = Array.new(score.length, 0)
  (1..score.length).each do |i|
      temp = ranked[i-1][1]
      if i == 1
          answer[temp] = "Gold Medal"
      elsif i == 2
          answer[temp] = "Silver Medal"
      elsif i == 3
          answer[temp] = "Bronze Medal"
      else   
          answer[temp] = i.to_s
      end
  end
  return answer
end


################ Alternative Solutions ################

def find_relative_ranks(score)
  n = score.length
  indices = (0...n).to_a
  indices.sort_by! { |i| -score[i] }

  answer = Array.new(n)

  indices.each_with_index do |idx, rank|
      if rank == 0
          answer[idx] = "Gold Medal"
      elsif rank == 1
          answer[idx] = "Silver Medal"
      elsif rank == 2
          answer[idx] = "Bronze Medal"
      else
          answer[idx] = (rank + 1).to_s
      end
  end

  answer
end
