#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

class Integer
	
	def divisible?
		
		(2..20).each do |x|
			
			if self % x != 0
				
				return false
			end
		end
		return true
	end
		
end
	
start = 2520

loop do

	if start.divisible?
		
		puts start
		exit
	else
	
		start += 20
	end

	if start % 1000 == 0
		
		puts start
	end
end
