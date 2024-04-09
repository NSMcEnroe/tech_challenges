################ Instructions ################ 

# The school cafeteria offers circular and square sandwiches at lunch break, referred to by numbers 0 and 1 respectively. All students stand in a queue. Each student either prefers square or circular sandwiches.

# The number of sandwiches in the cafeteria is equal to the number of students. The sandwiches are placed in a stack. At each step:

# If the student at the front of the queue prefers the sandwich on the top of the stack, they will take it and leave the queue.
# Otherwise, they will leave it and go to the queue's end.
# This continues until none of the queue students want to take the top sandwich and are thus unable to eat.

# You are given two integer arrays students and sandwiches where sandwiches[i] is the type of the i​​​​​​th sandwich in the stack (i = 0 is the top of the stack) and students[j] is the preference of the j​​​​​​th student in the initial queue (j = 0 is the front of the queue). Return the number of students that are unable to eat.


# Example 1:

# Input: students = [1,1,0,0], sandwiches = [0,1,0,1]
# Output: 0 
# Explanation:
# - Front student leaves the top sandwich and returns to the end of the line making students = [1,0,0,1].
# - Front student leaves the top sandwich and returns to the end of the line making students = [0,0,1,1].
# - Front student takes the top sandwich and leaves the line making students = [0,1,1] and sandwiches = [1,0,1].
# - Front student leaves the top sandwich and returns to the end of the line making students = [1,1,0].
# - Front student takes the top sandwich and leaves the line making students = [1,0] and sandwiches = [0,1].
# - Front student leaves the top sandwich and returns to the end of the line making students = [0,1].
# - Front student takes the top sandwich and leaves the line making students = [1] and sandwiches = [1].
# - Front student takes the top sandwich and leaves the line making students = [] and sandwiches = [].
# Hence all students are able to eat.
# Example 2:

# Input: students = [1,1,1,0,0,1], sandwiches = [1,0,0,0,1,1]
# Output: 3

# Constraints:

# 1 <= students.length, sandwiches.length <= 100
# students.length == sandwiches.length
# sandwiches[i] is 0 or 1.
# students[i] is 0 or 1.


################ Clarification Questions ################

# - Should the answer work if additional sandwiches or students are added?

# - Expected time and space complexity?

# - Although they both utilize stacks, can I solve it a different way?

################ Pseudocode ################ 

# -I'm thinking I stick with two stacks, with shifting and pushing when needed

# -Hold up, I might be over-complicating it.  I might be able to utilize a hashmap and compare the two arrays
# -NVM, example 2 contradicts this solution
# -Although there are 1 sandwiches left, they never make it to the top of the stack, so they will never be used

# -Going back to the two stacks
# -If sandwich/student are equal, shift both arrays
# - If not, store the student in a local varaible, shift and push
# -Will need a counter to make sure it stops when the cycle should end

################ First Attempt ################ 

# -Intresting, too much memory usage.  Will investigate

def count_students(students, sandwiches)
  count = 0
  while count < students.length
      if sandwiches[0] == students[0]
          sandwiches.shift
          students.shift
          count = 0
      else
          temp = students[0]
          students.shift
          students.push(temp)
          count += 1
      end
  end
  return count
end

################ Alternative Solutions ################

# -Same idea as mine, but didn't utlilze a local variable
# -The include in the while conditional is a nice touch, since it saves another variable
# -My solution is a little bit more readable, but I really like this solution

def count_students(students, sandwiches)
  while !students.empty? && students.include?(sandwiches[0])
      if students[0] == sandwiches[0]
          students.shift
          sandwiches.shift
      else
          students.push(students.shift)
      end
  end
  students.length
end