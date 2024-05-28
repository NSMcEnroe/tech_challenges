################ Instructions ################ 

# Given the root of a binary tree, return its maximum depth.

# A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

# Example 1:

# Input: root = [3,9,20,null,null,15,7]
# Output: 3
# Example 2:

# Input: root = [1,null,2]
# Output: 2

# Constraints:

# The number of nodes in the tree is in the range [0, 104].
# -100 <= Node.val <= 100

################ Clarification Questions ################

# - Should I solve this with the preferred DFS, or with BFS?

# - Preferred time and space complexity?

# - Recursive solution or brute force?

################ Pseudocode ################ 

# -Note: This is my third Attempt
# -My first attempt I was unfamiliar with DFS and binary trees
# -My second attempt I forgot what the alogrithm was
# -This attempt is focusing on the memorization of this algorithm

# -From what I remember, it's a recursion solution
# -I'll need to add a base step
# -This needs to return nothing when there is no current_node
# -For the recursion, we need to use root.left and root.right
# -However, will need to add +1 to the algorith to include the actual root

################ Third Attempt ################ 

def max_depth(root)
  if root == nil
      return 0
  end
  [max_depth(root.right), max_depth(root.left)].max + 1
end

################ Alternative Solutions ################

# -Queue solution

def max_depth(root)
  return 0 unless root
  res = 0
  queue = [root]
  until queue.empty?
      res += 1
      queue.size.times do
          node = queue.shift
          queue << node.left if node.left
          queue << node.right if node.right
      end
  end
  res
end
