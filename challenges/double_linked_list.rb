################ Instructions ################ 

# You are given the head of a non-empty linked list representing a non-negative integer without leading zeroes.

# Return the head of the linked list after doubling it.


# Example 1:


# Input: head = [1,8,9]
# Output: [3,7,8]
# Explanation: The figure above corresponds to the given linked list which represents the number 189. Hence, the returned linked list represents the number 189 * 2 = 378.
# Example 2:


# Input: head = [9,9,9]
# Output: [1,9,9,8]
# Explanation: The figure above corresponds to the given linked list which represents the number 999. Hence, the returned linked list reprersents the number 999 * 2 = 1998. 

# Constraints:

# The number of nodes in the list is in the range [1, 104]
# 0 <= Node.val <= 9
# The input is generated such that the list represents a number that does not have leading zeros, except the number 0 itself.


################ Clarification Questions ################

# -Is it possible to have only (multiple) zero nodes?

# -Preferred time and space complexity?

################ Pseudocode ################ 

# -Doesn't look to bad for a medium
# -Will need to use the usual current_node = head, then shift the current_node with next
# -Funnel the values into an array
# -Combine the array, double it, then convert back to array
# -Probably a more efficient way, but I'll worry about that after the initial submission

################ First Attempt ################ 

# -Will need to research more efficient time and space complexity

def double_it(head)
  answer = []
  current_node = head
  return [0] if current_node.val == 0 && current_node.next == nil
  until current_node == nil
      answer << current_node.val 
      current_node = current_node.next
  end
  manip = answer.join("").to_i
  manip *= 2
  answer = manip.digits.reverse
end


################ Alternative Solutions ################

# Solution doubles the actual value, and then accounts for the digits place

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def double_it(head)
  return nil if head.nil?

  # Pointer to traverse the list
  current = head
  carry = 0

  # Traverse the list and double each node's value
  while current
    current_val = current.val * 2 + carry
    current.val = current_val % 10
    carry = current_val / 10
    current = current.next
  end

  # If there is a carry left after the last node, add a new node
  if carry > 0
    current = head
    # Traverse to the end of the list
    current = current.next while current.next
    current.next = ListNode.new(carry)
  end

  head
end