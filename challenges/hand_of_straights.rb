################ Instructions ################ 

# Alice has some number of cards and she wants to rearrange the cards into groups so that each group is of size groupSize, and consists of groupSize consecutive cards.

# Given an integer array hand where hand[i] is the value written on the ith card and an integer groupSize, return true if she can rearrange the cards, or false otherwise.

# Example 1:

# Input: hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
# Output: true
# Explanation: Alice's hand can be rearranged as [1,2,3],[2,3,4],[6,7,8]
# Example 2:

# Input: hand = [1,2,3,4,5], groupSize = 4
# Output: false
# Explanation: Alice's hand can not be rearranged into groups of 4.


# Constraints:

# 1 <= hand.length <= 104
# 0 <= hand[i] <= 109
# 1 <= groupSize <= hand.length


################ Clarification Questions ################

# -Can I use the sort method?

# -Preferred time and space complexity?

# -Should I use a hash map?

################ Pseudocode ################ 

# -At least finding a false should be easy using a modulo
# -The biggest problem here is repeat numbers
# -If I could account for that, I could improve time and space complexity
# -Keep a counter for where I am in hand
# -Remove the cards group_size at a time
# -Check if the next number is the next integer
# -Remove if correct
# -At the end, should have an empty array

################ First Attempt ################ 

# -Pretty good, but fails the "harder" test cases

def is_n_straight_hand(hand, group_size)
  return false if hand.length % group_size != 0 
  hand.sort!
  until hand.length == 0
      i = 0
      part = false
      temp = hand.shift
      (group_size - 1).times do
          until part == true
              if hand[i] == temp + 1
                  temp = hand.delete_at(i)
                  part = true
              elsif i >= hand.length
                  return false
              elsif hand[i] > temp + 1
                  return false
              end
              i += 1
          end
          part = false
          i -= 1
      end
  end
  return true
end

################ Alternative Solutions ################

# -Much better runtime, but have to create a hash

def is_n_straight_hand(hand, group_size)
  return false if hand.length % group_size != 0 
  number_of_cards = hand.tally
  sorted = number_of_cards.keys.sort
  sorted.each do |card|
      next if number_of_cards[card] == 0
      amount = number_of_cards[card]
      group_size.times do |i|
          if !number_of_cards.key?(card + i)
              return false
          end
          if number_of_cards[card + i] < amount
              return false
          end
          number_of_cards[card + i] -= amount
      end
  end
  return true
end