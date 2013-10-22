#The prime factors of 13195 are 5, 7, 13 and 29.

#What is the largest prime factor of the number 600851475143 ?
class Integer
	def factor?
	
		if 600851475143 % self == 0
		
			return true
		end
	end

	def prime?
	
		(2..self**0.5).each do |z|
		
			if self % z == 0
			
				return false
			end
		end
		return true
	end
end
def largest_prime(x, y)
	
	max = 600851475143
	z = max / x
	
	if x.prime? 
	
		if z.prime? && 
			z > x && 
			z > y

			return z
		elsif x > y

			return x
		else
			
			return y
		end
	else 
		
		return y
	end
end

final_answer = 0
max = 600851475143
(2..max**0.5).each do |x|

	if x.factor?
		
		final_answer = largest_prime(x, final_answer)
	end
end

puts final_answer