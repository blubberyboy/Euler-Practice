#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

#Find the sum of all the primes below two million.
sum = 5
class Integer
	
	def prime?
		
		(3..self**0.5).each do |y|
			
			if self % y == 0
				
				return false
			end
		end
		return true
	end
end
(5..2000000).step(2) do |x|

	if x.prime?
		
		sum += x
	end
end
puts sum