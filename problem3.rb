#The prime factors of 13195 are 5, 7, 13 and 29.

#What is the largest prime factor of the number 600851475143 ?

(1...600851475143).each do |x|
	
	my_number = 600851475143 - x	
	(2...my_number).each do |y|
		
		break if my_number % y == 0
		
		if y == my_number - 1 && 
			x % y != 0
		
			puts my_number
			exit
		end
	end
end