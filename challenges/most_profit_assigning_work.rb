# - Note: Not Completed

################ Instructions ################ 

# You have n jobs and m workers. You are given three arrays: difficulty, profit, and worker where:

# difficulty[i] and profit[i] are the difficulty and the profit of the ith job, and
# worker[j] is the ability of jth worker (i.e., the jth worker can only complete a job with difficulty at most worker[j]).
# Every worker can be assigned at most one job, but one job can be completed multiple times.

# For example, if three workers attempt the same job that pays $1, then the total profit will be $3. If a worker cannot complete any job, their profit is $0.
# Return the maximum profit we can achieve after assigning the workers to the jobs.


# Example 1:

# Input: difficulty = [2,4,6,8,10], profit = [10,20,30,40,50], worker = [4,5,6,7]
# Output: 100
# Explanation: Workers are assigned jobs of difficulty [4,4,6,6] and they get a profit of [20,20,30,30] separately.
# Example 2:

# Input: difficulty = [85,47,57], profit = [24,66,99], worker = [40,25,25]
# Output: 0

# Constraints:

# n == difficulty.length
# n == profit.length
# m == worker.length
# 1 <= n, m <= 104
# 1 <= difficulty[i], profit[i], worker[i] <= 105


################ Clarification Questions ################

# -Looking at the arrays, a harder job does not imply more profit?

# -Preferred time and space complexity?


################ Pseudocode ################ 

# -I'm not seeing a way to do this other than O(n^2)
# -Run through each worker, and check which gives the bes profit
# -With a longer array, this won't work

################ First Attempt ################ 

# - Exceeds time limit, makes sense

def max_profit_assignment(difficulty, profit, worker)
  total = 0
  i = 0
  temp = 0
  (0..(worker.length-1)).each do |n|
      difficulty.each do |diff|
          if diff <= worker[n]
              temp = [temp, profit[i]].max
          end
          i += 1
      end
      total += temp
      i = 0
      temp = 0
  end
  return total
end

# -After looking at possible answers
# -Combine the difficulty with the profit
# -Sort the workers
# -Might need to sort the profit as well
# -Combine the worker with the most profit possible



