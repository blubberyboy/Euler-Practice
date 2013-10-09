#Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
#If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.

#For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

#Evaluate the sum of all the amicable numbers under 10000.

def sum_of_factors(x)
	sum = 0
	
	(1..x / 2).each do |y|
		
		if x % y == 0
			
			sum += y
		end
	end
	return sum
end

total_sum = 0
amicable_pairs = []

(2..10000).each do |x|
	
	already_found = false
	amicable = sum_of_factors(x)
	
	if x == sum_of_factors(amicable) && x != amicable	
			
		total_sum += x
	end
end
puts total_sum
