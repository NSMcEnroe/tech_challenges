################ Instructions ################ 

# Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.


# Example 1:


# Input: root = [1,2,3,null,5,null,4]
# Output: [1,3,4]
# Example 2:

# Input: root = [1,null,3]
# Output: [1,3]
# Example 3:

# Input: root = []
# Output: []

# Constraints:

# The number of nodes in the tree is in the range [0, 100].
# -100 <= Node.val <= 100

################ Clarification Questions ################

# -Can a node on the left side be included?

# -Preferred Space and Time Complexity?

# -Prefer DFS or BFS?

################ Pseudocode ################ 

# -This is my second attempt on the problem
# -At the time, I didn't understand DFS and BFS
# -Looking at this problem, BFS seems to be the right choice

# -Will want a stack, and then a correct values array
# -Boot the first in the stack, and add its children
# -Will then use the newly modified stack to include the right most values
# -Can't quite figure out how to do it in one stack, so I'm going to separate it into two arrays

################ Second Attempt ################ 

# -Just as I thought, too much in terms of storage
# -Will research how to do this in one singular data structure

def right_side_view(root)
  return [] if root == nil
  prev_level = []
  next_level = []
  right = []
  prev_level << root
  right << root.val
  while prev_level.length != 0
      while prev_level.length != 0
          next_level << prev_level[0].left
          next_level << prev_level[0].right
          prev_level.shift
      end
      next_level.delete(nil)
      if next_level.length != 0
          right << next_level[-1].val
      end
      prev_level = next_level
      next_level = []
  end
  return right
end

################ Alternative Solutions ################

def right_side_view(root)
  return [] unless root
  right_view = []
  queue = [root]

  while !queue.empty?
    level_length = queue.length
    last_value = nil

    level_length.times do
      node = queue.shift  # Get the next node in the queue
      last_value = node.val  # Store the last value seen at this level

      # Queue the child nodes for the next level of traversal
      queue << node.left if node.left
      queue << node.right if node.right
    end

    # After finishing this level, the last node value is the rightmost node of this level
    right_view << last_value if last_value
  end

  right_view
end


