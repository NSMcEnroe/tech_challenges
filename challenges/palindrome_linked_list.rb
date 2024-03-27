################ Instructions ################ 

# Given the head of a singly linked list, return true if it is a 
# palindrome or false otherwise.

# Example 1:

# Input: head = [1,2,2,1]
# Output: true

# Example 2:

# Input: head = [1,2]
# Output: false

# Constraints:

# The number of nodes in the list is in the range [1, 105].
# 0 <= Node.val <= 9

################ Clarification Questions ################

# 1) Would 1 node be considered a palindrome?  (Later correction, turned out to be yes.)

# 2) Can I modify the single linked list structure?  Would changing it to a double linked list actually make the answer more efficient?

# 3) Am I worried about storage?

################ Pseudocode ################ 

# -After working with Java, I am not a fan of how Ruby deals with linked lists
# -Want to do the usual current_node.next tactic
# -I'm thinking I store all the valuues into an array, then use two pointers
# -i is the start, j is the back
# -Make sure that i and j are equal to each other
# -Not great time or space complexity wise, but it'll have to do for now

################ First Attempt ################ 

def is_palindrome(head)
  current_node = head
  values = []
  values << current_node.val
  until current_node.next == nil
      current_node = current_node.next
      values << current_node.val
  end
  return true if values.length == 1
  i = 0
  j = values.length - 1
  while (values[i] == values[j]) && (i <= j)
      i += 1
      j -= 1
  end
  if (j = i - 1) && (values[i] == values[j])
      return true
  else 
      return false
  end
end


################ Second Attempt ################ 

#Ugh, assumes that palindromes are always even
# -Last conditional ruined everything
# -Now have to implement evens as well

def is_palindrome(head)
  current_node = head
  values = []
  values << current_node.val
  until current_node.next == nil
      current_node = current_node.next
      values << current_node.val
  end
  return true if values.length == 1
  i = 0
  j = values.length - 1
  while (values[i] == values[j]) && (i < j)
      i += 1
      j -= 1
  end
  if (j <= i) && (values[i] == values[j])
      return true
  else 
      return false
  end
end


################ Alternative Solutions ################

# Time Complexity: O(n)
# Space Complexity: O(1)

class NilClass
  def next = self
  def reverse = self
end

class ListNode
  include Enumerable
  
  def each
      yield(cur = self)
      yield(cur = cur.next) until cur.next.nil?
  end

  def split
      prev, p1, p2 = self, self, self
      prev, p1, p2 = p1, p1.next, p2.next.next until p2.nil? || p2.next.nil?
      prev.next = nil
      p1
  end

  def reverse
      prev, cur = nil, self
      cur.next, prev, cur = prev, cur, cur.next until cur.nil?
      prev
  end

  def eq?(o)
      all? {|v| 
          break false if o.nil?
          (ans, o = (v.val == o.val), o.next).first
      }
  end
end

def is_palindrome(head)
  return true if head.nil? || (p2 = head.split.reverse).nil?
  head.eq?(p2)
end