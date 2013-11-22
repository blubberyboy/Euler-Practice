#Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#43 44 45 46 47 48 49
#42 21 22 23 24 25 26
#41 20  7  8  9 10 27
#40 19  6  1  2 11 28
#39 18  5  4  3 12 29
#38 17 16 15 14 13 30
#37 36 35 34 33 32 31

# 8 16 24 
#It can be verified that the sum of the numbers on the diagonals is 101.

#What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

total_sum = 0
top_right = []
bottom_right = []
bottom_left = []
top_left = []
top_right << 1
(1..500).each do |x|
	
	bottom_right << top_right[-1] + x * 2
	top_right << (x * 8) + top_right[-1]
	bottom_left << bottom_right[-1] + x * 2
	top_left << bottom_left[-1] + x * 2
end
total_sum += bottom_right.inject{|sum,x| sum + x } + top_right.inject{|sum,x| sum + x } + bottom_left.inject{|sum,x| sum + x } + top_left.inject{|sum,x| sum + x }
puts total_sum