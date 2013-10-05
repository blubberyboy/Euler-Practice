#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

start = 20

loop do

	smallest_multiple = true
	(11..20).each do |x|
		
		if start % x != 0
		
			smallest_multiple = false
			break
		end
	end
	puts smallest_multiple
	if smallest_multiple
		
		puts start
		exit
	else
		
		start += 20
	end
end
