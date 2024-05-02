################ Instructions ################ 

# Given the roots of two binary trees p and q, write a function to check if they are the same or not.

# Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.


# Example 1:


# Input: p = [1,2,3], q = [1,2,3]
# Output: true
# Example 2:


# Input: p = [1,2], q = [1,null,2]
# Output: false
# Example 3:


# Input: p = [1,2,1], q = [1,1,2]
# Output: false

# Constraints:

# The number of nodes in both trees is in the range [0, 100].
# -104 <= Node.val <= 104

################ Clarification Questions ################

# -Preferred answer in DFS or BFS?

# -Preferred time and space complexity?

# -Can I replace null values with another value?

################ Pseudocode ################ 

# -Second attempt at this problem, didn't understand BFS before
# -Seems to be a queue like problem
# -Take a node, and see if it has children 
# -Add to the queue, then unshift the queue
# -Repeat, but store the values somewhere else
# -Check if they are the same values
# -Should be a way to check if it's wrong before, but can't think of an easy way how


################ Second Attempt ################ 

# -Inefficient answer

def is_same_tree(p, q)
  current_stack = [p]
  p_values = []
  while current_stack.length != 0
      temp = current_stack.shift
      if temp != nil
          p_values << temp.val
          current_stack << temp.left
          current_stack << temp.right
      else
          p_values << 99
      end
  end
  current_stack = [q]
  q_values = []
  while current_stack.length != 0
      temp = current_stack.shift
      if temp != nil
          q_values << temp.val
          current_stack << temp.left
          current_stack << temp.right
      else 
          q_values << 99
      end
  end
  p_values == q_values
end

################ Alternative Solutions ################

# -Fantastic recursion answer
# -Solves my problem of only checking at the end

def is_same_tree(p, q)
  if p.nil? && q.nil? then return true end
  if p.nil? || q.nil? then return false end
  unless p.val == q.val then return false end
  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end