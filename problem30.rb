#Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

#1634 = 14 + 64 + 34 + 44
#8208 = 84 + 24 + 04 + 84
#9474 = 94 + 44 + 74 + 44
#As 1 = 14 is not a sum it is not included.

#The sum of these numbers is 1634 + 8208 + 9474 = 19316.

#Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
class Integer
	
	def power_equal?
		
		power_sum = 0
		y = self.to_s.split('')
		
		y.each do |i|
			
			power_sum += i.to_i**5
		end
		
		if power_sum == self
			
			return true
		else
			
			return false
		end
	end
end
			

sum = 0
(2..355000).each do |x|

	if x.power_equal? 
		
		sum += x
	end
end
puts sum