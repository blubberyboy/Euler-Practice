#A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

#A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

#Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 
class Integer
	
	def factors
		
		factor_total = 1
		
		(2..Math.sqrt(self)).each do |y|
	
			if self % y == 0
				
				other_multiple = self / y
				factor_total += other_multiple unless other_multiple == y
				factor_total += y
			end
		end
		factor_total
	end
	
	def abundant?
		
		self.factors > self
	end
end
	
stored_abundants = []
total_sum = 0
sums = []

(12..28123).each do |x|

	if x.abundant?
			
		stored_abundants << x
	end
end
i = 0
puts stored_abundants.length
stored_abundants.each do |x|

	stored_abundants[i..stored_abundants.length].each do |y|
				
		sum = x + y
				
		if sum < 28123 
				
			sums << sum
		end
	end
	i += 1
end
sums.uniq!
sums.sort!

(1...28123).each do |y|
	
	unless sums.include? y
		
		total_sum += y
	end
	if y % 1000 == 0
		
		puts y
	end
end

puts total_sum