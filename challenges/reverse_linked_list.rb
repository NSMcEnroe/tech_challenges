################ Instructions ################ 

# Given the head of a singly linked list, reverse the list, and return the reversed list.

# Example 1:

# Input: head = [1,2,3,4,5]
# Output: [5,4,3,2,1]
# Example 2:

# Input: head = [1,2]
# Output: [2,1]
# Example 3:

# Input: head = []
# Output: []

# Constraints:

# The number of nodes in the list is the range [0, 5000].
# -5000 <= Node.val <= 5000

################ Clarification Questions ################

# -Can I implement a double linked list?

# -Preferred Time and Space Complexity?

# -Can I solve this without recursion?

################ Pseudocode ################ 

# - This is my second attempt at this problem
# - First attempt was a couple months ago
# - Was not as familar with solving linked list problems

# -Same problem as before, need to still reach back earlier in the linked list
# -I'm thinking that I will need 2 pointers
# -A lagging pointer and a future pointer
# -Will need to include a case for empty and single node lists
# -future_node.next = lagging_node
# -I'm getting caught up on how to proceed to the next node once switching .next

# -Wait, I may need three pointers
# -That way, one node is not affected by the switches, and can progress the chain
# -Need to add another case for two node lists

################ Second Attempt ################ 

# -Works, but not the greatest for time complexity
# -I'm assuming that will utilize recursion.

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end

def reverse_list(head)
  return head if head == nil
  return head if head.next == nil
  if head.next.next == nil
      current_node = head.next
      current_node.next = head
      head.next = nil
      return current_node
  end
  lagging_node = head
  center_node = head.next
  forward_node = center_node.next
  lagging_node.next = nil
  while forward_node != nil
      center_node.next = lagging_node
      lagging_node = center_node
      center_node = forward_node
      forward_node = forward_node.next
  end
  center_node.next = lagging_node
  return center_node
end


################ Alternative Solutions ################

# -Will need to study this solution
# -Seems in-line with other recursion algorithms

def reverse_list(head)
  return head if head.nil? || head.next.nil?
  
  original_head = head
  new_head = reverse_two_nodes(head)
  original_head.next = nil
  new_head
end

def reverse_two_nodes(head)
  new_head =  if head.next.next.nil?
                head.next
              else
                reverse_two_nodes(head.next)
              end
  head.next.next = head
  new_head
end
