################ Instructions ################ 

# You are given a 2D binary array grid. Find a rectangle with horizontal and vertical sides with the smallest area, such that all the 1's in grid lie inside this rectangle.

# Return the minimum possible area of the rectangle.

# Example 1:

# Input: grid = [[0,1,0],[1,0,1]]

# Output: 6

# Explanation:

# The smallest rectangle has a height of 2 and a width of 3, so it has an area of 2 * 3 = 6.

# Example 2:

# Input: grid = [[1,0],[0,0]]

# Output: 1

# Explanation:

# The smallest rectangle has both height and width 1, so its area is 1 * 1 = 1.

# Constraints:

# 1 <= grid.length, grid[i].length <= 1000
# grid[i][j] is either 0 or 1.
# The input is generated such that there is at least one 1 in grid.


################ Clarification Questions ################

# -Preferred time and space complexity?

# -Can the area be 0? (Looking at the conditions again, no)


################ Pseudocode ################ 

# -From the problem, it looks like I have to have a one left over on the top, left, right, and bottom
# -I don't think this would be the most precise way, but I could create 4 booleans for a 1 present
# -Then check each of the conditions
# -Pop them off if there is no one
# -Then run through the other three to check if they have ones
# -Top and bottom are easier, I can just remove those arrays in the index
# -For left and right, I will need to remove the ___most in each array


################ First Attempt ################ 

# -Absolutely terrible space and time complexity

def minimum_area(grid)
  top = false
  left = false
  bottom = false
  right = false
  until top == true && left == true && bottom == true && right == true
      return 0 if grid.flatten.count == 0
      if grid[0].include?(1)
          top = true
      else 
          grid.shift
          top = false
          left = false
          bottom = false
          right = false
      end
      if grid[-1].include?(1)
          bottom = true
      else 
          grid.pop
          top = false
          left = false
          bottom = false
          right = false
      end
      ones = false
      i = 0
      until i >= grid.length
          if grid[i][0] == 1
              ones = true
              i = grid.length
          else
              i += 1
          end
      end
      if ones == false
          grid.each do |array|
              array.shift
          end
          top = false
          left = false
          bottom = false
          right = false
      else
          left = true
      end
      ones = false
      i = 0
      until i >= grid.length
          if grid[i][-1] == 1
              ones = true
              i = grid.length
          else
              i += 1
          end
      end
      if ones == false
          grid.each do |array|
              array.pop
          end
          top = false
          left = false
          bottom = false
          right = false
      else
          right = true
      end
  end
  return grid.flatten.count
end



################ Alternative Solutions ################

def minimum_area(grid)
  rows = grid.length
  return 0 if rows == 0
  cols = grid[0].length
  return 0 if cols == 0

  top = rows
  bottom = -1
  left = cols
  right = -1

  # Find the bounds of the rectangle containing all 1s
  (0...rows).each do |i|
    (0...cols).each do |j|
      if grid[i][j] == 1
        top = [top, i].min
        bottom = [bottom, i].max
        left = [left, j].min
        right = [right, j].max
      end
    end
  end

  # If no 1s are found, return 0
  return 0 if top == rows

  # Calculate the area of the rectangle
  area = (bottom - top + 1) * (right - left + 1)
  return area
end