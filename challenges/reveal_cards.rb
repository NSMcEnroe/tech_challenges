################ Instructions ################ 

# You are given an integer array deck. There is a deck of cards where every card has a unique integer. The integer on the ith card is deck[i].

# You can order the deck in any order you want. Initially, all the cards start face down (unrevealed) in one deck.

# You will do the following steps repeatedly until all cards are revealed:

# Take the top card of the deck, reveal it, and take it out of the deck.
# If there are still cards in the deck then put the next top card of the deck at the bottom of the deck.
# If there are still unrevealed cards, go back to step 1. Otherwise, stop.
# Return an ordering of the deck that would reveal the cards in increasing order.

# Note that the first entry in the answer is considered to be the top of the deck.

# Example 1:

# Input: deck = [17,13,11,2,3,5,7]
# Output: [2,13,3,11,5,17,7]
# Explanation: 
# We get the deck in the order [17,13,11,2,3,5,7] (this order does not matter), and reorder it.
# After reordering, the deck starts as [2,13,3,11,5,17,7], where 2 is the top of the deck.
# We reveal 2, and move 13 to the bottom.  The deck is now [3,11,5,17,7,13].
# We reveal 3, and move 11 to the bottom.  The deck is now [5,17,7,13,11].
# We reveal 5, and move 17 to the bottom.  The deck is now [7,13,11,17].
# We reveal 7, and move 13 to the bottom.  The deck is now [11,17,13].
# We reveal 11, and move 17 to the bottom.  The deck is now [13,17].
# We reveal 13, and move 17 to the bottom.  The deck is now [17].
# We reveal 17.
# Since all the cards revealed are in increasing order, the answer is correct.
# Example 2:

# Input: deck = [1,1000]
# Output: [1,1000]

# Constraints:

# 1 <= deck.length <= 1000
# 1 <= deck[i] <= 106
# All the values of deck are unique.

################ Clarification Questions ################

- Am I ordering the random deck so another method can deal them?
- Can the values be negative?
- Expected Time and Space complexity?
- Is it possible to do this in a single array?

################ Pseudocode ################ 

# -It's taking me a moment to just figure out what the problem wants
# -So, I am ordering the deck before this is passed off to another method
# -I'm thinking of splitting this into two different arrays
# -When even, they should shuffle right in
# -When odd, there will need to be some index manipulation

# -Wait, that doesn't work at all, especially as the length gets longer
# -Following through to see if there is a math relationship, then I can shift the index to put the cards in the ordered deck
# -Doesn't work

# -Was able to finally get it through Jeapordy means
# -The hint was in the question and Example
# -I just need to reverse the process
# -Order from highest card
# -Unshift onto the answer deck
# -Place the last number right after that card (should do that first)
# -Will need to place certain logic if a deck of 1 or 2


################ First Attempt ################ 

# - Not ideal time complexity, but top response in terms of space complexity

def deck_revealed_increasing(deck)
  backwards_deck = deck.sort.reverse
  answer = [backwards_deck[0]]
  backwards_deck.shift
  while backwards_deck.length != 0
      x = backwards_deck[0]
      y = answer[-1]
      backwards_deck.shift
      answer.pop
      answer.unshift(y)
      answer.unshift(x)
  end
  return answer
end


################ Alternative Solutions ################

# -Create the asnwer array length before hand to optimize
# -Using indexes in the sorted deck for reference

def deck_revealed_increasing(deck)
  # Sort the deck in ascending order
  sorted_deck = deck.sort
  # Initialize a queue to simulate the process
  queue = (0...deck.length).to_a
  answer = Array.new(deck.length)
  
  sorted_deck.each do |card|
    # Place the card in the correct position according to the simulation
    answer[queue.shift] = card
    # Move the next top card to the bottom of the deck, if any
    queue.push(queue.shift) unless queue.empty?
  end
  
  answer
end

