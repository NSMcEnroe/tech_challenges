################ Instructions ################ 

# Given an m x n matrix of distinct numbers, return all lucky numbers in the matrix in any order.

# A lucky number is an element of the matrix such that it is the minimum element in its row and maximum in its column.


# Example 1:

# Input: matrix = [[3,7,8],[9,11,13],[15,16,17]]
# Output: [15]
# Explanation: 15 is the only lucky number since it is the minimum in its row and the maximum in its column.
# Example 2:

# Input: matrix = [[1,10,4,2],[9,3,8,7],[15,16,17,12]]
# Output: [12]
# Explanation: 12 is the only lucky number since it is the minimum in its row and the maximum in its column.
# Example 3:

# Input: matrix = [[7,8],[1,2]]
# Output: [7]
# Explanation: 7 is the only lucky number since it is the minimum in its row and the maximum in its column.

# Constraints:

# m == mat.length
# n == mat[i].length
# 1 <= n, m <= 50
# 1 <= matrix[i][j] <= 105.
# All elements in the matrix are distinct.

################ Clarification Questions ################

# -Is it possible to get more than one number?

# -Preferred space and time complexity?

# -Will there be negative numbers?

################ Pseudocode ################ 

# -For this problem, there are two conditions I need to meet
# -Min of a row
# -Max of a column
# -For Min, find the min through an enumerable
# -Columns will be harder
# -I'll use an i and j pointer to keep track of column
# -Iterate throgh the column, and hold the max
# -Find the intersection between mins and maxs

# -Totally forgot about transpose, made columns way easier


################ First Attempt ################ 

# -Space and time complexity can be improved

def lucky_numbers (matrix)
  mins = []
  maxs = []
  matrix.each do |row|
      mins << row.min
  end
  i = 0
  j = 0
  current_max = 0
  until i >= matrix[0].length
      until j >= matrix.length
          if matrix[j][i] > current_max
              current_max = matrix[j][i]
          end
          j += 1
      end
      maxs << current_max
      j = 0
      i += 1
      current_max = 0
  end
  mins & maxs
end


################ Alternative Solutions ################

# -Streamlined, and slightly better space and time complexity

def lucky_numbers (matrix)
  mins = matrix.map do |row|
      row.min
  end
  maxs = matrix.transpose.map do |column|
      column.max
  end
  mins & maxs
end