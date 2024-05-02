################ Instructions ################ 

# You are given the root of a binary search tree (BST) and an integer val.

# Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.


# Example 1:


# Input: root = [4,2,7,1,3], val = 2
# Output: [2,1,3]
# Example 2:


# Input: root = [4,2,7,1,3], val = 5
# Output: []

# Constraints:

# The number of nodes in the tree is in the range [1, 5000].
# 1 <= Node.val <= 107
# root is a binary search tree.
# 1 <= val <= 107

################ Clarification Questions ################

# -Do the left and right nodes have a consistent relationship with the parent node?

# -Preferred time and space complexity?

# -Assumption: There will be no repeat values.

################ Pseudocode ################ 

# -Second attempt at this problem
# -Didn't know before that binary search trees have a greater than/less that relationship with children nodes

# -To find the value, will need to compare val to node value
# -Node greater than?  Shift left
# -Otherwise shift right
# -Should bring you to the correct node

################ First Attempt ################ 

# -Didn't quite understand a binary search tree

# def search_bst(root, val)
  #   nodes_in_question = []
  #   answer = []
  #   present_node = root
  #   nodes_in_question << present_node
  #   until present_node.val == val 
  #     nodes_in_question << present_node.left
  #     nodes_in_question << present_node.right
  #     nodes_in_question.shift
  #     present_node = nodes_in_question[0]
  #   end
  #   present_node
  # #   i = 0
  # #   while present_node.val
  # #     answer << present_node.left
  # #     answer << present_node.right
  # #     i += 1
  # #     present_node = answer[i]
  # #   end
  # end

################ Second Attempt ################ 


def search_bst(root, val)
  current_node = root
  while current_node != nil
      if current_node.val > val
          current_node = current_node.left
      elsif current_node.val < val
          current_node = current_node.right
      elsif current_node.val = val
          return current_node
      end
  end
  return []
end

################ Alternative Solutions ################

# -Recursion Answer

def search_bst(root, val)
  dfs_bst root, val
end

def dfs_bst node, val
  if node.val == val
      return node
  elsif val < node.val and node.left
      return dfs_bst node.left, val       
  elsif val > node.val and node.right
      return dfs_bst node.right, val            
  end
  return nil
end