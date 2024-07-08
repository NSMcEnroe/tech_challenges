################ Instructions ################ 

# You are given the head of a linked list, which contains a series of integers separated by 0's. The beginning and end of the linked list will have Node.val == 0.

# For every two consecutive 0's, merge all the nodes lying in between them into a single node whose value is the sum of all the merged nodes. The modified list should not contain any 0's.

# Return the head of the modified linked list.


# Example 1:


# Input: head = [0,3,1,0,4,5,2,0]
# Output: [4,11]
# Explanation: 
# The above figure represents the given linked list. The modified list contains
# - The sum of the nodes marked in green: 3 + 1 = 4.
# - The sum of the nodes marked in red: 4 + 5 + 2 = 11.
# Example 2:


# Input: head = [0,1,0,3,0,2,2,0]
# Output: [1,3,4]
# Explanation: 
# The above figure represents the given linked list. The modified list contains
# - The sum of the nodes marked in green: 1 = 1.
# - The sum of the nodes marked in red: 3 = 3.
# - The sum of the nodes marked in yellow: 2 + 2 = 4.

# Constraints:

# The number of nodes in the list is in the range [3, 2 * 105].
# 0 <= Node.val <= 1000
# There are no two consecutive nodes with Node.val == 0.
# The beginning and end of the linked list have Node.val == 0.

################ Clarification Questions ################

# -The output appears to be just an array.  Can I circumvent the alteration of nodes and just post values?

# -Preferred time and space complexity?

# -Is a two pointer approach the preferred method?

################ Pseudocode ################ 

# -I will probably circumvent the modification of nodes
# -It looks like the output is just an array
# -So I'll keep the stored values separate to just run through the array once
# -I'll sum up values, and once I hit a zero, stored
# -Until loop until I hit a nil

################ First Attempt ################ 

# -Want to research node modification

def merge_nodes(head)
  values = []
  current_value = 0
  current_node = head.next
  until current_node == nil
      if current_node.val > 0
          current_value += current_node.val
      else
          values << current_value
          current_value = 0
      end
      current_node = current_node.next
  end
  return values
end

################ Alternative Solutions ################

def merge_nodes(head)
  b = head
  
      while head.next
      # p "new cicle, val = #{head.val}"
          first_zero = head if head.val == 0
          sum = 0
          head = head.next
          while head && head.val != 0
              sum += head.val
              head = head.next
              # p "sum = #{sum}"
          end
          # update next after first 0
          # p "next after 0 was = #{first_zero.next.val}, sum = #{sum}"
          first_zero.val = sum
          # point to next 0
          first_zero.next = head.next ? head : nil
          # p "new head = #{head.val}"
  
      end
      b
  end