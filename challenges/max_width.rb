################ Instructions ################ 

# Given n points on a 2D plane where points[i] = [xi, yi], Return the widest vertical area between two points such that no points are inside the area.

# A vertical area is an area of fixed-width extending infinitely along the y-axis (i.e., infinite height). The widest vertical area is the one with the maximum width.

# Note that points on the edge of a vertical area are not considered included in the area.


# Example 1:

# Input: points = [[8,7],[9,9],[7,4],[9,7]]
# Output: 1
# Explanation: Both the red and the blue area are optimal.
# Example 2:

# Input: points = [[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]]
# Output: 3

# Constraints:

# n == points.length
# 2 <= n <= 105
# points[i].length == 2
# 0 <= xi, yi <= 109

################ Clarification Questions ################

# -To specify, the y-values do not matter in this problem correct?

# -Preferred time and space complexity?

# -Should this solition also work for -x and -y values, and do them being positive in the contraints give a clue to the preferred answer?


################ Pseudocode ################ 

# -Will need to pluck the x-values out of the original array
# -Don't want to create a new array, but I don't see another way without deleting the y values, which seems intensive
# -I will need a max width counter
# -I think I will use an integer counter as well, since it does not take too much space
# -Actually will need to quick sort, which will be O(nlogn)
# -Then compare the difference between indexes i and i-1


################ First Attempt ################ 

# -Satisfied with time and space complexity based off other answers

def max_width_of_vertical_area(points)
  x_values = []
  answer = 0
  points.each do |array|
      x_values << array[0]
  end
  i = 0
  x_sort = x_values.sort
  while i < x_sort.length
      if answer < (x_sort[i] - x_sort[i-1])
          answer = (x_sort[i] - x_sort[i-1])
      end
      i += 1
  end
  return answer
end

################ Alternative Solutions ################

# -Minimizes new variables 
# -Utilizes range function

def max_width_of_vertical_area(points)
  points.sort!
  result = 0

  (1...points.length).each do |i|
      result = [result, points[i][0]-points[i-1][0]].max
  end
  result
end

