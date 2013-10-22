#The following iterative sequence is defined for the set of positive integers:

#n  n/2 (n is even)
#n  3n + 1 (n is odd)

#Using the rule above and starting with 13, we generate the following sequence:

#13  40  20  10  5  16  8  4  2  1
#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

#Which starting number, under one million, produces the longest chain?

#NOTE: Once the chain starts the terms are allowed to go above one million.

longest_chain = 0
longest_chain_num = 0

(1..1000000).each do |x|

	chain_count = 0	
	start = 1000001 - x
	
	loop do
	
		if start % 2 == 0
	
			start = start / 2 
		else
	
			start = 3 * start + 1
		end
		chain_count += 1
		break if start == 1
	end

	if longest_chain < chain_count
	
		longest_chain = chain_count
		longest_chain_num = 1000001 - x
	end
end

puts longest_chain_num