################ Instructions ################ 

There are n friends that are playing a game. The friends are sitting in a circle and are numbered from 1 to n in clockwise order. More formally, moving clockwise from the ith friend brings you to the (i+1)th friend for 1 <= i < n, and moving clockwise from the nth friend brings you to the 1st friend.

The rules of the game are as follows:

Start at the 1st friend.
Count the next k friends in the clockwise direction including the friend you started at. The counting wraps around the circle and may count some friends more than once.
The last friend you counted leaves the circle and loses the game.
If there is still more than one friend in the circle, go back to step 2 starting from the friend immediately clockwise of the friend who just lost and repeat.
Else, the last friend in the circle wins the game.
Given the number of friends, n, and an integer k, return the winner of the game.


################ Clarification Questions ################

# -Am I allowed a brute force approach?

# -Preferred time and space complexity?

################ Pseudocode ################ 

# -This looks like it could be solved by a math formula
# -However, I'm not seeing it
# -Try a brute force approach, while also creating a player array
# -Will need to keep track of position
# -Should be current pos + (k-1)
# -Will also need to go back one since the array shifted
# -Once I go around, hit an if else conditional resetting the array


################ First Attempt ################ 

# -Not time optimal

def find_the_winner(n, k)
  players = []
  (1..n).each do |i|
      players << i
  end
  pos = (k-1)
  left = n
  until left == 1
      players.delete_at(pos)
      print players
      left -= 1
      pos += (k-1)
      print pos
      until pos < left
          pos = pos - left
      end
  end
  return players[0]
end

################ Alternative Solutions ################

# -Known math formula (Josephus Problem)

def find_the_winner(n, k)
  winner = 0
  (1..n).each do |i|
      winner = (winner + k) % i
  end
  winner + 1
end